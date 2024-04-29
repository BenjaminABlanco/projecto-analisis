import 'package:flutter/material.dart';

class CustomTooltip extends StatelessWidget {
  final String message;
  final Widget child;

  const CustomTooltip({Key? key, required this.message, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: message,
      decoration: BoxDecoration(
        color: Color(0xFF141414),
        borderRadius: BorderRadius.circular(5),
      ),
      textStyle: TextStyle(
        color: Colors.white,
        fontSize: 14,
      ),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      verticalOffset: 30,
      child: child,
    );
  }
}