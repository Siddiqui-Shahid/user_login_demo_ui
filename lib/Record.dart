import 'dart:core';

class Rec {
  final String name;
  final String date;
  final String email;
  Rec({required this.name, required this.date, required this.email});
}

List<Rec> recordEntered = [];

// class NotesDatabase {
//   static final NotesDatabase instance = NotesDatabase._init();
//
//   static Database? _database;
//   NotesDatabase._init();
//   Future<Database?> get database async {
//     if (_database != null) return _database;
//     _database = await _initDB('notes.db');
//     return _database;
//   }
//
//   Future<Database> _initDB(String filePath) async {
//     final dbpath = await getDatabasesPath();
//     final path = join(dbpath, filePath);
//     return await openDatabase(path, version: 1, onCreate: _createDb);
//   }
// }
