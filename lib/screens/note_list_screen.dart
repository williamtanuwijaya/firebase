import 'package:flutter/material.dart';
import 'package:notes/services/note_service.dart';
import 'package:notes/widgets/note_dialog.dart';

class NoteListScreen extends StatefulWidget {
  const NoteListScreen({super.key});

  @override
  State<NoteListScreen> createState() => _NoteListScreenState();
}

class _NoteListScreenState extends State<NoteListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
      ),
      body: const NoteList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return NoteDialog();
              });
        },
        tooltip: 'Add Note',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class NoteList extends StatelessWidget {
  const NoteList({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: NoteService.getNoteList(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error : ${snapshot.error}');
        }
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const Center(
              child: CircularProgressIndicator(),
            );
          default:
            return ListView(
              padding: const EdgeInsets.only(bottom: 80),
              children: snapshot.data!.map((document) {
                return Card(
                    child: ListTile(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return NoteDialog(note: document);
                      },
                    );
                  },
                  title: Text(document['Title']),
                  subtitle: Text(document['Description']),
                  trailing: InkWell(
                    onTap: () {
                      // _showDeleteConfirmationDialog(context, document['id']);
                    },
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Icon(Icons.delete),
                    ),
                  ),
                ));
              }).toList(),
            );
        }
      },
    );
  }
}

void _showDeleteConfirmationDialog(BuildContext context, String documentId) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Konfirmasi'),
          content: const Text('Apakah Anda yakin ingin menghapus item ini ?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Tidak'),
            ),
            TextButton(
              onPressed: () {
                _deleteItem(documentId);
                Navigator.of(context).pop();
              },
              child: const Text('Ya'),
            ),
          ],
        );
      });
}

void _deleteItem(String documentId) {
  NoteService.deleteNote(documentId);
}
