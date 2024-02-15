import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit_states.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/colors_list_view.dart';
import 'package:notes_app/widgets/custom_button.dart';

import 'package:notes_app/widgets/custom_text_form_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? noteTitle, noteContent;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          CustomTextFormField(
            hintText: "Title",
            onSaved: (value) => noteTitle = value,
          ),
          const SizedBox(
            height: 16.0,
          ),
          CustomTextFormField(
            hintText: "Content",
            onSaved: (value) => noteContent = value,
            maxLines: 5,
          ),
          const SizedBox(
            height: 32.0,
          ),
          const ColorsListView(),
          const SizedBox(
            height: 32.0,
          ),
          BlocBuilder<AddNoteCubit, AddNoteStates>(
            builder: (context, state) {
              return CustomButton(
                isDataLoading: state is AddNoteLoadingState ? true : false,
                buttonTitle: 'Add',
                onTap: () {
                  var currentDate = DateTime.now();
                  var formattedCurrentDate =
                      DateFormat('dd-mm-yyyy').format(currentDate);
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    var noteModel = NoteModel(
                      noteTitle: noteTitle!,
                      noteContent: noteContent!,
                      dateTime: formattedCurrentDate,
                      noteColor: Colors.blue.value,
                    );
                    BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          ),
          const SizedBox(
            height: 16.0,
          ),
        ],
      ),
    );
  }
}
