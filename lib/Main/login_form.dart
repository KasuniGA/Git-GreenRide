// ignore_for_file: non_constant_identifier_names,, unused_field, file_names, avoid_unnecessary_containers, unused_import

import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:green/Main/forgot_passward.dart';
import 'package:green/home_page/main_home.dart';

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
      return const MainHome();
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
          return 'Enter correct password';
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
      appBar: AppBar(
        actions: const [
          Image(
              image: AssetImage("assets/logo_trial-VqAv6Aw70-transformed.png"))
        ],
      ),
      body: Form(
        key: _loginkey,
        child: Container(
          color: const Color.fromARGB(250, 153, 204, 253),
          child: ListView(
            children: [
              const SizedBox(
                height: 100,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Center(
                      child: Text(
                    "L O G I N ",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(250, 0, 77, 153)),
                  )),
                  const SizedBox(
                    height: 60,
                  ),
                  const Center(
                    child: Text(
                      "Unlock Your Journey with GreenRide",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
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
                    child: SizedBox(
                      height: 60,
                      width: 350,
                      child: ElevatedButton(
                          onPressed: () {
                            signIn();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(250, 0, 77, 153),
                          ),
                          child: const Text(
                            "LOGIN",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )),
                    ),
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
