import 'package:flutter/material.dart';
import 'package:round3/view/widgets/custom_Button.dart';
import 'package:round3/view/widgets/custom_Textfield.dart';

class AddDriverPage extends StatelessWidget {
  AddDriverPage({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController licenseController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Driver'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            CustomTextField(hintText: 'Enter Name', controller: nameController),
            CustomTextField(
                hintText: 'Enter Mobile', controller: mobileController),
            CustomTextField(
                hintText: 'Enter License Number',
                controller: licenseController),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
            ),
            CustomButton(
              txt: 'Save',
              ontap: () {},
              txtColor: Colors.white,
              buttonColor: Colors.red,
            )
          ],
        ),
      ),
    );
  }
}
