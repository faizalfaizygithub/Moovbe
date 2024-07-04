import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;

  Function()? validatorr;
  CustomTextField(
      {super.key,
      required this.hintText,
      required this.controller,
      this.validatorr});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 10),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return "$hintText is empty";
          }
          return null;
        },
        controller: controller,
        decoration: InputDecoration(
          fillColor: Colors.grey.shade300,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
