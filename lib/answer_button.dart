import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  //** answerText , onTap are named arguments becuase they r inside {} next to super.key */
  const AnswerButton({
    super.key,
    required this.answerText,
    required this.onTap,
  });
  final String answerText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(margin: const EdgeInsets.only(bottom: 2, top: 2),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
          backgroundColor: const Color.fromARGB(255, 77, 47, 87),
          foregroundColor: Colors.white,
          elevation: 5,
      
          //* There are too many shapes you can play with **
          shape: const BeveledRectangleBorder(
            borderRadius: BorderRadiusGeometry.all(Radius.circular(20)),
          ),
        ),
      
        child: Text(answerText),
      ),
    );
  }
}
