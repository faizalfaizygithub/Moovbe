import 'package:flutter/material.dart';
import 'package:round3/view/Pages/login_page.dart';
import 'package:round3/view/widgets/custom_Button.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _SplashScreeState();
}

class _SplashScreeState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Colors.red,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Center(child: Image.asset('assets/logo.png'))),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: CustomButton(
          txt: 'Get Started',
          ontap: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => LoginPage()));
          },
          txtColor: Colors.red,
          buttonColor: Colors.white,
        ));
  }
}
