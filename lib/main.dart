// ignore_for_file: use_key_in_widget_constructors, camel_case_types

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:green/firebase_option.dart';
import 'package:green/theam/splash_screen.dart';
import 'package:green/theam/theam.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(app());
}

class app extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Open App",
      themeMode: ThemeMode.system,
      theme: MyTheams.lighttheme,
      darkTheme: MyTheams.darktheme,
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
