import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/read_note_cubit/read_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';

import 'package:notes_app/views/edit_note_view.dart';
import 'package:notes_app/views/notes_home_view.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNotesBox);
  // to make hive recognize that it will handle a model
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReadNoteCubit(),
      child: MaterialApp(
        theme: ThemeData(brightness: Brightness.dark, fontFamily: 'Poppins'),
        routes: {
          NotesHomeView.noteHomeViewId: (context) => const NotesHomeView(),
          EditNoteView.editNoteViewId: (context) => EditNoteView(
                note: ModalRoute.of(context)!.settings.arguments as NoteModel,
              ),
        },
        debugShowCheckedModeBanner: false,
        initialRoute: NotesHomeView.noteHomeViewId,
      ),
    );
  }
}
