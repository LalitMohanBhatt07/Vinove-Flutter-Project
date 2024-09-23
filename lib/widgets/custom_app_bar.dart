import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  CustomAppBar({required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true, // This enables the hamburger icon
      title: Text(title),
      backgroundColor: Colors.purple,
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            // Handle search action
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
