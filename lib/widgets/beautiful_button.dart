import 'package:flutter/material.dart';

class BeautifulButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const BeautifulButton({Key? key, required this.text, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: Colors.blue,
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      child: Text(text),
    );
  }
}
