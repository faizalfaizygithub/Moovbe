import 'package:flutter/material.dart';

class CustomBox extends StatelessWidget {
  final String headOne;
  final String headTwo;
  final String imageURL;
  final Color boxColor;
  final Function() ontap;

  const CustomBox(
      {super.key,
      required this.headOne,
      required this.headTwo,
      required this.imageURL,
      required this.boxColor,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.only(left: 10, top: 10),
        decoration: BoxDecoration(
            color: boxColor, borderRadius: BorderRadius.circular(12)),
        height: MediaQuery.of(context).size.height * 0.3,
        width: MediaQuery.of(context).size.width * 0.5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              headOne,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              headTwo,
              style: TextStyle(
                fontSize: 10,
                color: Colors.white,
              ),
            ),
            Align(
                alignment: Alignment.bottomRight, child: Image.asset(imageURL))
          ],
        ),
      ),
    );
  }
}
