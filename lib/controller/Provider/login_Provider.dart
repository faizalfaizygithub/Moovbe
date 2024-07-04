import 'package:flutter/material.dart';
import 'package:round3/controller/Services/login_services.dart';
import 'package:round3/model/login_model.dart';
import 'package:round3/view/Pages/home_page.dart';
import 'package:round3/view/widgets/secrets.dart';

class LoginProvider with ChangeNotifier {
  final LoginServices _loginRepository = LoginServices();
  Login? _login;
  String? _message;
  bool _isLoading = false;

  Login? get login => _login;

  String? get message => _message;

  bool get isLoading => _isLoading;

  Future<void> loginUser(
      {required BuildContext context,
      required String username,
      required String password}) async {
    _isLoading = true;
    notifyListeners();

    _login = await _loginRepository.login(username, password);
    if (_login != null) {
      Secrets.apiKey = _login?.accessToken ?? '';
      Secrets.token = _login?.refreshToken ?? '';
      _message = _login?.message;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(_message ?? 'Login failed')),
      );
    }

    _isLoading = false;
    notifyListeners();
  }
}
