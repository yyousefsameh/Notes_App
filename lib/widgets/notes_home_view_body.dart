import 'package:flutter/material.dart';

import 'package:notes_app/widgets/notes_list_view_seperated.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: NotesListView(),
    );
  }
}
