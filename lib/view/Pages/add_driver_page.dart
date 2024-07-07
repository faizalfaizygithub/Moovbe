import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:round3/controller/Provider/driver_provider.dart';
import 'package:round3/view/Pages/driver_page.dart';
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
        title: const Text('Add Driver'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
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
              ontap: () {
                context.read<DriverProvider>().addDriver(nameController.text,
                    mobileController.text, licenseController.text);

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DriverPage()));
              },
              txtColor: Colors.white,
              buttonColor: Colors.red,
            )
          ],
        ),
      ),
    );
  }
}
