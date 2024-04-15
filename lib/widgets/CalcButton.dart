import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  final Function callback;
  final String text;
  final double textSize;
  final int color; 
  final double widthButton; 
  const CalcButton(
      {super.key,
      required this.callback,
      required this.text,
      required this.textSize, 
      required this.color, 
      required this.widthButton});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: SizedBox(
        width: widthButton,
        height: 75,
        child: TextButton(
          onPressed: () => {callback(text)},
          style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Color(color),
              padding: const EdgeInsets.all(16),
              alignment: Alignment.center,
              textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          child: Text(
            text,
            style: TextStyle(fontSize: textSize),
          ),
        ),
      ),
    );
  }
}
