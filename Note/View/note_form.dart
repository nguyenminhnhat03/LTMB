import 'package:flutter/material.dart';
import '../Model/Note.dart';
import '../db/notedatahelper.dart';

class NoteFormScreen extends StatefulWidget {
  final Note? note;
  final VoidCallback onSave;

  NoteFormScreen({this.note, required this.onSave});

  @override
  _NoteFormScreenState createState() => _NoteFormScreenState();
}

class _NoteFormScreenState extends State<NoteFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late String title;
  late String content;
  late int priority;
  late List<String> tags;
  late NoteDatabase _noteDatabase;
  bool _isDatabaseInitialized = false; // Theo dõi trạng thái khởi tạo database

  @override
  void initState() {
    super.initState();
    title = widget.note?.title ?? '';
    content = widget.note?.content ?? '';
    priority = widget.note?.priority ?? 1;
    tags = widget.note?.tags ?? [];
    _noteDatabase = NoteDatabase();
    _initDatabase(); // Khởi tạo database
  }

  Future<void> _initDatabase() async {
    try {
      await _noteDatabase.initializeDatabase();
      setState(() {
        _isDatabaseInitialized = true; // Đánh dấu database đã sẵn sàng
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Lỗi khởi tạo cơ sở dữ liệu: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.note == null ? 'Thêm Ghi Chú' : 'Sửa Ghi Chú'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                initialValue: title,
                decoration: InputDecoration(
                  labelText: 'Tiêu đề',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Tiêu đề không được bỏ trống';
                  }
                  return null;
                },
                onSaved: (value) {
                  title = value!;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                initialValue: content,
                decoration: InputDecoration(
                  labelText: 'Nội dung',
                  border: OutlineInputBorder(),
                ),
                maxLines: 5,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nội dung không được bỏ trống';
                  }
                  return null;
                },
                onSaved: (value) {
                  content = value!;
                },
              ),
              SizedBox(height: 16),
              DropdownButtonFormField<int>(
                value: priority,
                decoration: InputDecoration(
                  labelText: 'Ưu Tiên',
                  border: OutlineInputBorder(),
                ),
                items: [1, 2, 3].map((p) => DropdownMenuItem(
                  value: p,
                  child: Text('Ưu Tiên $p'),
                )).toList(),
                onChanged: (value) {
                  setState(() {
                    priority = value ?? 1; // Giá trị mặc định nếu null
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Vui lòng chọn mức ưu tiên';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                initialValue: tags.join(', '),
                decoration: InputDecoration(
                  labelText: 'Gắn thẻ (cách nhau bởi dấu phẩy)',
                  border: OutlineInputBorder(),
                ),
                onSaved: (value) {
                  if (value != null && value.isNotEmpty) {
                    tags = value.split(',').map((t) => t.trim()).where((t) => t.isNotEmpty).toList();
                  } else {
                    tags = [];
                  }
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _isDatabaseInitialized ? _saveNote : null, // Vô hiệu hóa nút nếu database chưa sẵn sàng
                child: Text('Lưu'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _saveNote() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      try {
        final note = Note(
          id: widget.note?.id,
          title: title,
          content: content,
          priority: priority,
          createdAt: widget.note?.createdAt ?? DateTime.now(),
          modifiedAt: DateTime.now(),
          tags: tags.isNotEmpty ? tags : null,
        );

        if (widget.note == null) {
          await _noteDatabase.insertNote(note);
        } else {
          await _noteDatabase.updateNote(note);
        }

        widget.onSave();
        Navigator.pop(context);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Lỗi khi lưu ghi chú: $e')),
        );
      }
    }
  }

  @override
  void dispose() {
    _noteDatabase.close();
    super.dispose();
  }
}