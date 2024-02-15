import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({
    super.key,
    required this.isColorPicked,
    required this.itemColor,
  });
  final bool isColorPicked;
  final Color itemColor;
  @override
  Widget build(BuildContext context) {
    return isColorPicked
        ? CircleAvatar(
            radius: 38,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 34,
              backgroundColor: itemColor,
            ),
          )
        : CircleAvatar(
            radius: 38,
            backgroundColor: itemColor,
          );
  }
}

class ColorsListView extends StatefulWidget {
  const ColorsListView({
    super.key,
    this.isColorPicked = false,
  });
  final bool isColorPicked;

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            currentIndex = index;
            BlocProvider.of<AddNoteCubit>(context).itemColor =
                kcolorsList[index];
            setState(() {});
          },
          child: ColorItem(
            itemColor: kcolorsList[index],
            isColorPicked: currentIndex == index,
          ),
        ),
        separatorBuilder: (context, index) => const SizedBox(
          width: 10.0,
        ),
        itemCount: kcolorsList.length,
      ),
    );
  }
}
