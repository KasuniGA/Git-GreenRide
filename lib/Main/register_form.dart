// ignore_for_file: non_constant_identifier_names, unused_field, file_names, prefer_final_fields, unused_local_variable

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:green/Main/login_form.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final Fname = TextEditingController();
  final Lname = TextEditingController();
  final Sid = TextEditingController();
  final Mobile = TextEditingController();
  final Email = TextEditingController();
  final Pass = TextEditingController();
  final Pass2 = TextEditingController();

  bool _passwordvisible = false;

  // String _Fname = "";
  // String _Lname = "";
  // String _Sid = "";
  // String _Mobile = "";
  // String _Email = "";
  // String _Pass = "";

  Future singUp() async {
    // create user
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: Email.text.trim(), password: Pass.text.trim());

    // add user
    await FirebaseFirestore.instance.collection('users').add({
      'First Name': Fname.text,
      'Last Name': Lname.text,
      'Student ID': Sid.text,
      'Mobile Number': Mobile.text,
      'Email': Email.text,
      'Password': Pass.text,
    });
    //reset details
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userCredential.user!.email)
        .set({
      'Email': Email.text.split('@')[0],
    });
  }

  Widget _firstname() {
    return TextFormField(
      controller: Fname,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Enter First name',
      ),
      validator: (fname) {
        if (fname!.isEmpty) {
          return 'First name cannot be Empty';
        }
        return null;
      },
      // onChanged: (fname) {
      //   setState(() {
      //     _Fname = fname;
      //   });
      // },
    );
  }

  Widget _lastName() {
    return TextFormField(
      controller: Lname,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Enter Last name',
      ),
      validator: (lname) {
        if (lname!.isEmpty) {
          return 'Last name cannot be Empty';
        }
        return null;
      },
      // onChanged: (lname) {
      //   setState(() {
      //     _Lname = lname;
      //   });
      // },
    );
  }

  Widget _studentId() {
    return TextFormField(
      controller: Sid,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        labelText: 'Enter Student ID',
        border: OutlineInputBorder(),
      ),
      validator: (sid) {
        if (sid!.isEmpty) {
          return 'First name cannot be Empty';
        }
        return null;
      },
      // onChanged: (sid) {
      //   setState(() {
      //     _Sid = sid;
      //   });
      // },
    );
  }

  Widget _mobilenum() {
    return IntlPhoneField(
      showCountryFlag: false,
      controller: Mobile,
      dropdownIcon: const Icon(Icons.arrow_drop_down),
      initialCountryCode: 'SL',
      keyboardType: TextInputType.phone,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Enter Mobile Number',
      ),
      // onChanged: (text) {
      //   setState(() {
      //     // Mobile.text = text.completeNumber;
      //   });
      // },
    );
  }

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
      controller: Pass,
      obscureText: !_passwordvisible,
      decoration: InputDecoration(
          filled: true,
          //fillColor: darktheme ? Colors.black45 : Colors.grey.shade200,
          border: const OutlineInputBorder(),
          labelText: 'Enter your Password',
          suffixIcon: IconButton(
              icon: Icon(
                  _passwordvisible ? Icons.visibility : Icons.visibility_off),
              onPressed: () {
                setState(() {
                  _passwordvisible = !_passwordvisible;
                });
              })),
      validator: (pass) {
        if (pass!.length < 6) {
          return 'First name cannot be Empty';
        }
        return null;
      },
    );
  }

  Widget _password2() {
    return TextFormField(
      controller: Pass2,
      obscureText: !_passwordvisible,
      decoration: InputDecoration(
          filled: true,
          //fillColor: darktheme ? Colors.black45 : Colors.grey.shade200,
          border: const OutlineInputBorder(),
          labelText: 'Enter your Password',
          suffixIcon: IconButton(
              icon: Icon(
                  _passwordvisible ? Icons.visibility : Icons.visibility_off),
              onPressed: () {
                setState(() {
                  _passwordvisible = !_passwordvisible;
                });
              })),
      validator: (passs) {
        if (passs != Pass.text) {
          return 'password doesnot match';
        }
        return null;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    bool darktheme =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Container(
                margin: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Center(
                      child: Text(
                        "Rigister Form",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 16),
                      child: _firstname(),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 16),
                      child: _lastName(),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 16),
                      child: _studentId(),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 16),
                      child: _mobilenum(),
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 16),
                      child: _password2(),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 30.0, top: 15.0),
                        child: ElevatedButton(
                            onPressed: () async {
                              if (_formkey.currentState!.validate()) {
                                singUp();
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (_) {
                                  return const LoginPage();
                                }));
                              } else {}
                            },
                            child: const Text("Sign Up")),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }

  @override
  void dispose() {
    Fname.dispose();
    Lname.dispose();
    Sid.dispose();
    Mobile.dispose();
    Email.dispose();
    Pass.dispose();
    Pass2.dispose();
    super.dispose();
  }
}
