class Note {
  String title;
  String description;

  Note({required this.title, required this.description});

  // Convert Note to JSON
  Map<String, dynamic> toJson() {
    return {'title': title, 'description': description};
  }

  // Convert JSON to Note
  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(title: json['title'], description: json['description']);
  }
}
