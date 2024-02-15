import 'package:hive/hive.dart';

part 'note_model.g.dart';

@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  @HiveField(0)
  String noteTitle;
  @HiveField(1)
  String noteContent;
  @HiveField(2)
  final String dateTime;
  @HiveField(3)
  int noteColor;

  NoteModel({
    required this.noteTitle,
    required this.noteContent,
    required this.dateTime,
    required this.noteColor,
  });
}
