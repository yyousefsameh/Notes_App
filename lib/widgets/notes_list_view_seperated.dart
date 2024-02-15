import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/read_note_cubit/read_note_cubit.dart';
import 'package:notes_app/cubits/read_note_cubit/read_note_cubit_states.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadNoteCubit, ReadNotesStates>(
      builder: (context, state) {
        List<NoteModel> notesList =
            BlocProvider.of<ReadNoteCubit>(context).notesList ?? [];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: ListView.separated(
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) => NoteItem(
              note: notesList[index],
            ),
            itemCount: notesList.length,
            separatorBuilder: (context, index) => const SizedBox(
              height: 20.0,
            ),
          ),
        );
      },
    );
  }
}
