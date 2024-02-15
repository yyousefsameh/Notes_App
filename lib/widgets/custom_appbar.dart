import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.iconButtonIcon,
    this.onPressed,
  });

  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight); // TODO: implement preferredSize
  final String title;
  final IconData? iconButtonIcon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 28.0,
        ),
      ),
      actions: [
        IconButton(
          onPressed: onPressed,
          icon: Container(
            height: 46.0,
            width: 46.0,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.05),
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Icon(
              iconButtonIcon,
              size: 28.0,
            ),
          ),
        ),
      ],
    );
  }
}
