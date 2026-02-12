import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week_05/task-04/model/note_model.dart';
import 'package:week_05/task-04/providers/notes_providers.dart';

class NotesListPage extends StatefulWidget {
  const NotesListPage({super.key});

  @override
  State<NotesListPage> createState() => _NotesListPageState();
}

class _NotesListPageState extends State<NotesListPage> {
  String search = "";

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<NotesProvider>();

    final filteredNotes = provider.notes
        .where(
          (note) => note.title.toLowerCase().contains(search.toLowerCase()),
        )
        .toList();

    return Scaffold(
      appBar: AppBar(title: const Text("Notes App")),

      // 🔍 SEARCH FIELD
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              decoration: const InputDecoration(
                hintText: "Search Notes",
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() => search = value);
              },
            ),
          ),

          // 📋 NOTES LIST
          Expanded(
            child: ListView.builder(
              itemCount: filteredNotes.length,
              itemBuilder: (context, index) {
                final note = filteredNotes[index];

                return Dismissible(
                  key: UniqueKey(),

                  // 👉 Swipe Delete
                  background: Container(color: Colors.red),

                  onDismissed: (_) {
                    provider.deleteNote(index);
                  },

                  child: ListTile(
                    title: Text(note.title),
                    subtitle: Text(note.description),

                    // 👉 Edit
                    onTap: () => showNoteDialog(context, provider, index, note),
                  ),
                );
              },
            ),
          ),
        ],
      ),

      // ➕ ADD BUTTON
      floatingActionButton: FloatingActionButton(
        onPressed: () => showNoteDialog(context, provider, null, null),
        child: const Icon(Icons.add),
      ),
    );
  }

  // ADD + EDIT DIALOG
  void showNoteDialog(
    BuildContext context,
    NotesProvider provider,
    int? index,
    Note? note,
  ) {
    final titleController = TextEditingController(text: note?.title);
    final descController = TextEditingController(text: note?.description);

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(index == null ? "Add Note" : "Edit Note"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(hintText: "Title"),
            ),
            TextField(
              controller: descController,
              decoration: const InputDecoration(hintText: "Description"),
            ),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              final newNote = Note(
                title: titleController.text,
                description: descController.text,
              );

              if (index == null) {
                provider.addNote(newNote);
              } else {
                provider.updateNote(index, newNote);
              }

              Navigator.pop(context);
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }
}
