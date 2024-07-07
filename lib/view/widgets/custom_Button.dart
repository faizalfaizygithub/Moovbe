import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:round3/controller/Provider/driver_provider.dart';

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
    final provider = Provider.of<DriverProvider>(context);
    return GestureDetector(
      onTap: ontap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
            color: buttonColor, borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: provider.isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Text(
                  txt,
                  style: TextStyle(
                      color: txtColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
        ),
      ),
    );
  }
}
