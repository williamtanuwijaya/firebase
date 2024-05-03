import 'package:flutter/material.dart';
import 'package:notes/services/note_service.dart';

class NoteDialog extends StatelessWidget {
  final Map<String, dynamic>? note;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  NoteDialog({super.key, this.note}) {
    if (note != null) {
      _titleController.text = note!['title'];
      _descriptionController.text = note!['description'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        note == null ? 'Add Notes' : 'Update Notes',
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Title : ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            textAlign: TextAlign.start,
          ),
          TextField(
            controller: _titleController,
            // decoration: InputDecoration(
            //   hintText: document['Title'],
            // ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Text(
              'Description : ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18, // Sesuaikan dengan ukuran yang Anda inginkan
              ),
              textAlign: TextAlign.start,
            ),
          ),
          TextField(
            controller: _descriptionController,
            // decoration: InputDecoration(
            //   hintText: document['Description'],
            // ),
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); //Pop untuk menutup
              },
              child: const Text('Cancel')),
        ),
        ElevatedButton(
          onPressed: () {
            if (note == null) {
              NoteService.addNote(
                      _titleController.text, _descriptionController.text)
                  .whenComplete(() {
                Navigator.of(context).pop();
              });
            } else {
              NoteService.updateNote(note!['id'], _titleController.text,
                      _descriptionController.text)
                  .whenComplete(() => Navigator.of(context).pop());
              // NoteService.updateNote(document['id'], titleController.text,
              //         descriptionController.text)
              //     .whenComplete(() => Navigator.of(context).pop());
            }
          },
          child: Text(note == null ? 'Add' : 'Update'),
        ),
      ],
    );
  }
}
