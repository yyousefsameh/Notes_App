import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:notes_app/cubits/read_note_cubit/read_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';

import 'package:notes_app/widgets/custom_appbar.dart';
import 'package:notes_app/widgets/custom_text_form_field.dart';
import 'package:notes_app/widgets/edit_note_colors_list_view.dart';

class EditNoteView extends StatefulWidget {
  const EditNoteView({super.key, required this.note});
  static String editNoteViewId = 'EditNoteView';
  final NoteModel note;

  @override
  State<EditNoteView> createState() => _EditNoteViewState();
}

class _EditNoteViewState extends State<EditNoteView> {
  String? noteTitleEdited, noteContentEdited;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Edit Note',
        iconButtonIcon: Icons.check,
        onPressed: () {
          saveEditedNote();
          Navigator.pop(context);
          BlocProvider.of<ReadNoteCubit>(context).fetchAllNotes();
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextFormField(
              onChanged: (noteTitleData) {
                noteTitleEdited = noteTitleData;
              },
              hintText: widget.note.noteTitle,
            ),
            const SizedBox(
              height: 16.0,
            ),
            CustomTextFormField(
              onChanged: (noteContentData) {
                noteContentEdited = noteContentData;
              },
              hintText: widget.note.noteContent,
              maxLines: 5,
            ),
            const SizedBox(
              height: 16.0,
            ),
            EditNoteColorsList(
              note: widget.note,
            ),
          ],
        ),
      ),
    );
  }

  void saveEditedNote() {
    widget.note.noteTitle = noteTitleEdited ?? widget.note.noteTitle;
    widget.note.noteContent = noteContentEdited ?? widget.note.noteContent;
    widget.note.save();
  }
}
