import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:round3/controller/Provider/busList_provider.dart';
import 'package:round3/controller/Provider/driver_provider.dart';
import 'package:round3/controller/Provider/login_Provider.dart';
import 'package:round3/view/Pages/splashScreeen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoginProvider(),
        ),
        ChangeNotifierProvider(create: (context) => HomeProvider()),
        ChangeNotifierProvider(create: (context) => DriverProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            appBarTheme: AppBarTheme(
                backgroundColor: Colors.black87,
                foregroundColor: Colors.white,
                titleTextStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
                centerTitle: true)),
        home: SplashScreen(),
      ),
    );
  }
}
