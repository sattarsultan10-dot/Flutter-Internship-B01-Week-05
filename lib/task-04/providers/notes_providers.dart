import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:week_05/task-04/model/note_model.dart';

class NotesProvider extends ChangeNotifier {
  List<Note> _notes = [];

  List<Note> get notes => _notes;

  NotesProvider() {
    loadNotes();
  }

  // LOAD NOTES
  Future<void> loadNotes() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString('notes');

    if (data != null) {
      final List decoded = jsonDecode(data);
      _notes = decoded.map((e) => Note.fromJson(e)).toList();
      notifyListeners();
    }
  }

  // SAVE NOTES
  Future<void> saveNotes() async {
    final prefs = await SharedPreferences.getInstance();
    final encoded = jsonEncode(_notes.map((note) => note.toJson()).toList());
    await prefs.setString('notes', encoded);
  }

  // ADD NOTE
  void addNote(Note note) {
    _notes.add(note);
    saveNotes();
    notifyListeners();
  }

  // UPDATE NOTE
  void updateNote(int index, Note note) {
    _notes[index] = note;
    saveNotes();
    notifyListeners();
  }

  // DELETE NOTE
  void deleteNote(int index) {
    _notes.removeAt(index);
    saveNotes();
    notifyListeners();
  }
}
