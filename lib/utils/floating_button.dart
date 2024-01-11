import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FloatingButton extends StatelessWidget {
   FloatingButton({super.key, this.addButton});

  VoidCallback? addButton;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: addButton,
      child: Container(
        height: 80,
        width: 80,
        decoration: BoxDecoration(
            border: Border.all(),
            color: Colors.amber,
            borderRadius: BorderRadius.circular(10)),
        child: const Icon(Icons.add_rounded),
      ),
    );
  }
}
