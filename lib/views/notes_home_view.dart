import 'package:flutter/material.dart';

import 'package:notes_app/constants.dart';

import 'package:notes_app/widgets/add_note_bottom_sheet.dart';
import 'package:notes_app/widgets/custom_appbar.dart';
import 'package:notes_app/widgets/notes_home_view_body.dart';

class NotesHomeView extends StatefulWidget {
  const NotesHomeView({super.key});
  static String noteHomeViewId = 'NotesHomeView';

  @override
  State<NotesHomeView> createState() => _NotesHomeViewState();
}

class _NotesHomeViewState extends State<NotesHomeView> {
  bool searchIconIsPressed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Notes',
        iconButtonIcon: Icons.search,
        onPressed: () {
          setState(() {
            searchIconIsPressed = !searchIconIsPressed;
          });
        },
      ),
      body: const NotesViewBody(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kprimaryColor,
        child: const Icon(
          Icons.add,
          size: 35,
          color: Colors.white,
        ),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            builder: (context) => const AddNoteBottomSheet(),
          );
        },
      ),
    );
  }
}
