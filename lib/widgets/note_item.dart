import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/cubits/read_note_cubit/read_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_note_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.note});

  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 24.0, left: 16.0, bottom: 24.0),
      decoration: BoxDecoration(
        color: Color(note.noteColor),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            title: Text(
              note.noteTitle,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 26.0,
              ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                note.noteContent,
                style: TextStyle(
                  color: Colors.black.withOpacity(.5),
                  fontSize: 18.0,
                ),
              ),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () => Navigator.pushNamed(
                    context,
                    EditNoteView.editNoteViewId,
                    arguments: note,
                  ),
                  icon: const Icon(
                    FontAwesomeIcons.pen,
                    color: Colors.black,
                    size: 24.0,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    note.delete();
                    BlocProvider.of<ReadNoteCubit>(context).fetchAllNotes();
                  },
                  icon: const Icon(
                    FontAwesomeIcons.trash,
                    color: Colors.black,
                    size: 24.0,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: Text(
              note.dateTime,
              style: TextStyle(
                color: Colors.black.withOpacity(.5),
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
