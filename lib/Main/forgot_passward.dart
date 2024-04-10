// ignore_for_file: unused_field, file_names, non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Forgotpass extends StatefulWidget {
  const Forgotpass({super.key});

  @override
  State<Forgotpass> createState() => _ForgotpassState();
}

class _ForgotpassState extends State<Forgotpass> {
  Future reset() async {
    await FirebaseAuth.instance
        .sendPasswordResetEmail(email: Email.text.trim())
        .then((value) {
      Fluttertoast.showToast(
          msg: "We have send an Email to reset your passwoard");
    }).onError((error, stackTrace) {
      Fluttertoast.showToast(msg: "Error :\n ${error.toString()}");
    });
  }

  final GlobalKey<FormState> _forgotpass = GlobalKey<FormState>();

  final Email = TextEditingController();
  Widget _email() {
    return TextFormField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Enter a NSBM Email',
      ),
      controller: Email,
      validator: (email) {
        if (email!.isEmpty) {
          return 'First name cannot be Empty';
        }
        return null;
      },
    );
  }

  // Widget _password() {
  //   return TextFormField(
  //     obscureText: true,
  //     controller: Pass,
  //     decoration: const InputDecoration(
  //       border: OutlineInputBorder(),
  //       labelText: 'Enter your Password',
  //     ),
  //     validator: (pass) {
  //       if (pass!.isEmpty) {
  //         return 'First name cannot be Empty';
  //       }
  //       return null;
  //     },
  //     // onSaved: (pass) {
  //     //   _Pass = pass!;
  //     // },
  //   );
  // }

  // Widget _cpassword() {
  //   return TextFormField(
  //     obscureText: true,
  //     controller: Pass,
  //     decoration: const InputDecoration(
  //       border: OutlineInputBorder(),
  //       labelText: 'Enter your Password',
  //     ),
  //     validator: (pass) {
  //       if (pass!.isEmpty) {
  //         return 'First name cannot be Empty';
  //       }
  //       return null;
  //     },
  //     // onSaved: (pass) {
  //     //   _Pass = pass!;
  //     // },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
          child: ListView(
            children: [
              const Icon(
                Icons.lock,
                size: 100,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Center(
                      child: Text(
                        "Reset Your Password",
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      )),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    child: _email(),
                  ),
                  // Padding(
                  //   padding:
                  //       const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  //   child: _password(),
                  // ),
                  // Padding(
                  //   padding:
                  //       const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  //   child: _cpassword(),
                  // ),
                  Center(
                    child: ElevatedButton(
                        onPressed: () {
                          reset();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[200],
                        ),
                        child: const Text(
                          "Reset Password",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
  @override

  void dispose() {
    Email.dispose();
    super.dispose();

  }
}
