// ignore_for_file: non_constant_identifier_names,, unused_field, file_names, avoid_unnecessary_containers, unused_import
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:green/Main/forgot.dart';
import 'package:green/users/users.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _loginkey = GlobalKey<FormState>();

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: Email.text.trim(), password: Pass.text.trim());

    // ignore: use_build_context_synchronously
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return const Users();
    }));
  }

  final Email = TextEditingController();
  final Pass = TextEditingController();

  // String _Email = "";
  // String _Pass = "";

  Widget _email() {
    return TextFormField(
      controller: Email,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Enter a NSBM Email',
      ),

      validator: (email) {
        if (email!.isEmpty) {
          return 'First name cannot be Empty';
        }
        if (EmailValidator.validate(email) != true) {
          return 'not an validate email';
        }
        if (email.endsWith('@students.nsbm.ac.lk')) {
          return null; // Valid email
        } else {
          return 'Please enter a valid NSBM student email (e.g., username@students.nsbm.ac.lk)';
        }
      },
      // onChanged: (email) {
      //   setState(() {
      //     _Email = email;
      //   });
      // },
    );
  }

  Widget _password() {
    return TextFormField(
      obscureText: true,
      controller: Pass,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Enter your Password',
      ),
      validator: (pass) {
        if (pass!.isEmpty) {
          return 'First name cannot be Empty';
        }
        return null;
      },
      // onSaved: (pass) {
      //   _Pass = pass!;
      // },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _loginkey,
        child: Container(
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
                        "Login",
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 16),
                    child: _email(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 16),
                    child: _password(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (_) {
                              return const Forgotpass();
                            }));
                          },
                          child: const Text("Forgot Password"),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: ElevatedButton(
                        onPressed: () {
                          signIn();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[200],
                        ),
                        child: const Text(
                          "Sign In",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    Email.dispose();
    Pass.dispose();
    super.dispose();
  }
}
