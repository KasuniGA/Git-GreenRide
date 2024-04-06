// ignore_for_file: non_constant_identifier_names, unused_field, camel_case_types, file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:green/Main/gome.dart';
import 'package:green/users/confirm.dart';
import 'package:green/users/users.dart';

class ridersway extends StatefulWidget {
  const ridersway({super.key});

  @override
  State<ridersway> createState() => _riderswayState();
}

class _riderswayState extends State<ridersway> {
  final GlobalKey<FormState> _riderkey = GlobalKey<FormState>();

  final Brand = TextEditingController();
  final Model = TextEditingController();
  final Year = TextEditingController();
  final NoOfS = TextEditingController();
  final Email = TextEditingController();

  Future vehicleSubmit() async {
    // create user
    // await FirebaseAuth.instance.signInWithEmailAndPassword(
    //     email: Email.text.trim(), password: Pass.text.trim());

    // add user
    await FirebaseFirestore.instance.collection('drivers').add({
      'Brand': Brand.text,
      'Modle': Model.text,
      'Year': Year.text,
      'Space': NoOfS.text,
      'Email': Email.text,
      // 'Password': Pass.text,
    });
  }

  Widget _brand() {
    return TextFormField(
      controller: Brand,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        labelText: 'Enter Vehicle Brand',
      ),
      onSaved: (brand) {
        brand = brand!;
      },
    );
  }

  Widget _model() {
    return TextFormField(
      controller: Model,
      decoration: InputDecoration(
        hintText: 'Car',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        labelText: 'Enter Vehicle Modle',
      ),
      validator: (model) {
        if (model!.isEmpty) {
          return 'Vehicle Modle cannot be Empty';
        }
        return null;
      },
      onSaved: (model) {
        model = model!;
      },
    );
  }

  Widget _year() {
    return TextFormField(
      controller: Year,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'Enter Vehicle year',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      onSaved: (year) {
        year = year!;
      },
    );
  }

  Widget _noOfS() {
    return TextFormField(
      controller: NoOfS,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        labelText: 'Enter avaliable space in vehicle',
      ),
      validator: (NoOfS) {
        if (NoOfS!.isEmpty) {
          return 'Enter avalability';
        }
        return null;
      },
      onSaved: (NoOfS) {
        NoOfS = NoOfS!;
      },
    );
  }

  Widget _email() {
    return TextFormField(
      controller: Email,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        drawer: Drawer(
          child: Container(
            color: Colors.grey,
            child: ListView(
              children: [
                const DrawerHeader(
                    child: Center(
                      child: Text(
                        "Green Ride Menu",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )),
                ListTile(
                  leading: const Icon(Icons.people),
                  title: const Text("User"),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                      return const HomePage();
                    }));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text("Home"),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                      return const HomePage();
                    }));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.task),
                  title: const Text("Activity"),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                      return const HomePage();
                    }));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text("Profile"),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                      return const HomePage();
                    }));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text("Settings"),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                      return const HomePage();
                    }));
                  },
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: _riderkey,
              child: Column(
                children: [
                  _email(),
                  const SizedBox(
                    height: 15,
                  ),
                  _brand(),
                  const SizedBox(
                    height: 15,
                  ),
                  _model(),
                  const SizedBox(
                    height: 15,
                  ),
                  _year(),
                  const SizedBox(
                    height: 15,
                  ),
                  _noOfS(),
                  const SizedBox(
                    height: 15,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (_) {
                              return const Users();
                            }));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[200],
                          ),
                          child: const Text(
                            "Cancle",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                      const SizedBox(
                        width: 30,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            if (_riderkey.currentState!.validate()) {
                              vehicleSubmit();
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (_) {
                                return const RideConfirm();
                              }));
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[200],
                          ),
                          child: const Text(
                            "Next",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }

  @override
  void dispose() {
    Brand.dispose();
    Model.dispose();
    Year.dispose();
    NoOfS.dispose();
    Email.dispose();
    super.dispose();
  }
}
