import 'package:flutter/material.dart';
import 'package:rapid_recall/utils/color_pallete.dart';

// ignore: must_be_immutable
class FloatingButton extends StatelessWidget {
  FloatingButton({super.key, this.addButton});

  VoidCallback? addButton;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: addButton,
      child: Container(
        height: 70,
        width: 70,
        decoration: BoxDecoration(
            border: Border.all(width: 3),
            color: AppColors.foregroundColor,
            borderRadius: BorderRadius.circular(10)),
        child: const Icon(
          Icons.add_rounded,
          size: 50,
        ),
      ),
    );
  }
}
