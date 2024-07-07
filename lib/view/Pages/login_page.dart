import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:round3/controller/Provider/login_Provider.dart';
import 'package:round3/view/widgets/custom_Button.dart';
import 'package:round3/view/widgets/custom_Textfield.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  TextEditingController usernameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    return Consumer<LoginProvider>(
      builder: (context, value, child) => Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Container(
                  height: 250,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.black87,
                    image: DecorationImage(
                      image: AssetImage('assets/p1.png'),
                    ),
                  ),
                  child: const Align(
                    alignment: Alignment.center,
                    child: ListTile(
                      title: Text(
                        'Welcome',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                      subtitle: Text(
                        'Manage your Bus and Drivers',
                        style: TextStyle(color: Colors.white70, fontSize: 10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextField(
                  controller: usernameController,
                  hintText: 'Enter Username',
                ),
                CustomTextField(
                    hintText: 'Enter Password', controller: passwordController),
                const SizedBox(
                  height: 100,
                ),
                CustomButton(
                    txtColor: Colors.white,
                    buttonColor: Colors.red,
                    txt: 'Login',
                    ontap: () async {
                      if (formKey.currentState!.validate()) {
                        await loginProvider.loginUser(
                          username: usernameController.text,
                          password: passwordController.text,
                          context: context,
                        );
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
