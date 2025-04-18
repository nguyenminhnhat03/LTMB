import 'package:flutter/material.dart';
import '../Model/Note.dart';
import '../db/notedatahelper.dart';
import 'note_form.dart';

class NoteListScreen extends StatefulWidget {
  @override
  _NoteListScreenState createState() => _NoteListScreenState();
}

class _NoteListScreenState extends State<NoteListScreen> {
  late NoteDatabase _db; // Sử dụng instance cụ thể thay vì singleton
  List<Note> notes = [];
  String searchQuery = '';
  bool isGridView = false; // Thêm chế độ Grid/List

  @override
  void initState() {
    super.initState();
    _db = NoteDatabase();
    _initializeAndRefreshNotes();
  }

  Future<void> _initializeAndRefreshNotes() async {
    try {
      await _db.initializeDatabase();
      _refreshNotes();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Lỗi khởi tạo danh sách: $e')),
      );
    }
  }

  void _refreshNotes() async {
    try {
      final data = searchQuery.isEmpty
          ? await _db.getAllNotes()
          : await _db.searchNotes(searchQuery);
      setState(() => notes = data);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Lỗi tải ghi chú: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Danh sách ghi chú'),
        actions: [
          IconButton(
            icon: Icon(isGridView ? Icons.list : Icons.grid_view),
            onPressed: () => setState(() => isGridView = !isGridView),
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'refresh') _refreshNotes();
              if (value == 'filter') _showFilterDialog();
            },
            itemBuilder: (context) => [
              PopupMenuItem(value: 'refresh', child: Text('Làm mới')),
              PopupMenuItem(value: 'filter', child: Text('Lọc theo ưu tiên')),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Tìm kiếm ghi chú',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                setState(() => searchQuery = value);
                _refreshNotes();
              },
            ),
          ),
          Expanded(
            child: notes.isEmpty
                ? Center(child: Text('Không có ghi chú nào'))
                : isGridView
                ? GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.0,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              padding: EdgeInsets.all(8.0),
              itemCount: notes.length,
              itemBuilder: (context, index) => NoteItem(
                note: notes[index],
                onDelete: _refreshNotes,
              ),
            )
                : ListView.builder(
              padding: EdgeInsets.all(8.0),
              itemCount: notes.length,
              itemBuilder: (context, index) => NoteItem(
                note: notes[index],
                onDelete: _refreshNotes,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => NoteFormScreen(onSave: _refreshNotes)),
        ),
        child: Icon(Icons.add),
      ),
    );
  }

  void _showFilterDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Lọc theo ưu tiên'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [1, 2, 3].map((p) => ListTile(
            title: Text('Ưu tiên $p'),
            onTap: () async {
              try {
                final filtered = await _db.getNotesByPriority(p);
                setState(() => notes = filtered);
                Navigator.pop(context);
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Lỗi lọc ghi chú: $e')),
                );
              }
            },
          )).toList(),
        ),
        actions: [
          TextButton(
            onPressed: () {
              _refreshNotes(); // Reset về tất cả ghi chú
              Navigator.pop(context);
            },
            child: Text('Hủy lọc'),
          ),
        ],
      ),
    );
  }
}

class NoteItem extends StatelessWidget {
  final Note note;
  final VoidCallback onDelete;

  NoteItem({required this.note, required this.onDelete});

  get _db => null;

  Color _getPriorityColor(int priority) {
    switch (priority) {
      case 1:
        return Colors.blueGrey[500]!;
      case 2:
        return Colors.blueGrey[300]!;
      case 3:
        return Colors.blueGrey[200]!;
      default:
        return Colors.grey[200]!;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Sử dụng màu từ note.color nếu có, nếu không thì dùng màu ưu tiên
    Color backgroundColor = note.color != null
        ? Color(int.parse('FF${note.color!.substring(1)}', radix: 16))
        : _getPriorityColor(note.priority);

    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue[100],
          child: Text(
            note.title.isNotEmpty ? note.title[0].toUpperCase() : '',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Text(
          note.title,
          style: TextStyle(color: Colors.black87),
        ),
        subtitle: Text(
          note.content.length > 50 ? '${note.content.substring(0, 50)}...' : note.content,
          style: TextStyle(color: Colors.black54),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.edit, color: Colors.blue),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => NoteFormScreen(note: note, onSave: onDelete),
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () async {
                bool? confirm = await showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: Text('Xác nhận xóa'),
                    content: Text('Bạn có chắc muốn xóa ghi chú này?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context, false),
                        child: Text('Hủy'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context, true),
                        child: Text('Xóa'),
                      ),
                    ],
                  ),
                );
                if (confirm == true) {
                  try {
                    await _db.deleteNote(note.id!);
                    onDelete();
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Lỗi khi xóa ghi chú: $e')),
                    );
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}