import 'package:flutter/material.dart';
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool back;

  @override
  final Size preferredSize;

  CustomAppBar({required this.title, this.back = false})
      : preferredSize = Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      leading: Builder(
        builder: (BuildContext context) {
          return Tooltip(
            message: 'Abrir Menú Lateral', // Custom tooltip message
            child: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          );
        },
      ),
      actions: back
          ? [
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ]
          : null,
    );
  }
}