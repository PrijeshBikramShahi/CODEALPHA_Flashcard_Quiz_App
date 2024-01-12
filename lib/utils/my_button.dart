import 'package:flutter/material.dart';
import 'package:rapid_recall/utils/color_pallete.dart';

// ignore: must_be_immutable
class MyButton extends StatelessWidget {
  MyButton({super.key, required this.text, required this.onTap});

  final Text text;
  VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        
        height: 50,
        width: 100,
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(
            color: AppColors.shadowColor1,
            offset: Offset(1, 2)
          )],
          border: Border.all(width: 2),
          borderRadius: BorderRadius.circular(10),
          color: AppColors.foregroundColor,
        ),
        padding: const EdgeInsets.all(10),
        child: text,
      ),
    );
  }
}
