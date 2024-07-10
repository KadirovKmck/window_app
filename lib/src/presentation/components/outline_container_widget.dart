import 'package:flutter/material.dart';

class OutlineContainerWidget extends StatelessWidget {
  const OutlineContainerWidget({
    super.key,
    this.backgroundColor,
    required this.title,
  });
  final Color? backgroundColor;
  final String title;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        side: const BorderSide(
          color: Colors
              .transparent, // Use a transparent border if you don't want a visible border
          width: 2, // Customize the border width if needed
        ),
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18.5,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
