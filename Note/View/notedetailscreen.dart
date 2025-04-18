import 'package:flutter/material.dart';
import '../Model/Note.dart';
import 'note_form.dart';

class NoteDetailScreen extends StatelessWidget {
  final Note note;

  NoteDetailScreen({required this.note});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(note.title),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => NoteFormScreen(
                  note: note,
                  onSave: () => Navigator.pop(context),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Tiêu đề: ${note.title}', style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text('Nội dung: ${note.content}'),
            SizedBox(height: 10),
            Text('Ưu tiên: ${note.priority}'),
            SizedBox(height: 10),
            Text('Thời gian tạo: ${note.createdAt}'),
            SizedBox(height: 10),
            Text('Cập nhật lần cuối: ${note.modifiedAt}'),
            SizedBox(height: 10),
            if (note.tags != null && note.tags!.isNotEmpty)
              Text('Tags: ${note.tags!.join(", ")}'),
          ],
        ),
      ),
    );
  }
}