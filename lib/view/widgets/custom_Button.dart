import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String txt;
  final Function() ontap;
  Color? buttonColor;
  Color? txtColor;

  CustomButton(
      {super.key,
      required this.txt,
      required this.ontap,
      this.buttonColor,
      this.txtColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
            color: buttonColor, borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(
            txt,
            style: TextStyle(
                color: txtColor, fontSize: 12, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
