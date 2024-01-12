import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
   MyButton({
    super.key,
    required this.text,
    this.onTap
  });

  final Text text;
  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.red,
        ),
        padding: EdgeInsets.all(10),
        child: text,
      ),
    );
  }
}
