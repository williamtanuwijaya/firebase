import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class NoteDialog extends StatelessWidget {
  final String? noteId;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  NoteDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        noteId == null ? 'Add Notes' : 'Update Notes',
        style: TextStyle(
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
            if (noteId == null) {
              
            } else {
              // NoteService.updateNote(document['id'], titleController.text,
              //         descriptionController.text)
              //     .whenComplete(() => Navigator.of(context).pop());
            }
          },
          child: Text(noteId == null ? 'Add' : 'Update'),
        ),
      ],
    );
  }
}
