// ignore_for_file: unnecessary_import, unnecessary_const

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:green/Main/login_form.dart';
import 'package:green/profile.dart';
import 'package:green/ride_sharedb/ride_share.dart';
import 'package:green/second_screens/transport_schedule.dart';
import 'package:green/second_screens/transport_widget.dart';

class MainHome extends StatefulWidget {
  const MainHome({super.key});

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  Widget stwidet() {
    return Center(
      child: GestureDetector(
        child: SizedBox(
          height: 200,
          width: 300,
          child: Card(
            color: const Color.fromARGB(254, 0, 156, 120),
            child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/school bus-cuate.png'))),
              child: const SizedBox(
                height: 150,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Transport Schedules",
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (_) {
            return const TransportSchedule();
          }));
        },
      ),
    );
  }

  Widget rdwidet() {
    return Center(
      child: GestureDetector(
        child: SizedBox(
          height: 200,
          width: 300,
          child: Card(
            color: const Color.fromARGB(220, 22, 51, 154),
            child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/Carpool-cuate.png'))),
              child: const SizedBox(
                height: 150,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Ride Sharing",
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (_) {
            return const RideShare();
          }));
        },
      ),
    );
  }

  Widget slogn() {
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "G R E E N ",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 34,
                  color: const Color.fromARGB(254, 0, 156, 120)),
            ),
            Text(
              " R I D E",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 34,
                  color: const Color.fromARGB(220, 22, 51, 154)),
            ),
          ],
        ),
        SizedBox(
          height: 6,
        ),
        Text(
          "Navigate, Share, Commute Greener",
          style: TextStyle(fontWeight: FontWeight.bold),
        )
      ],
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
      drawer: Drawer(
        child: Container(
          color: const Color.fromARGB(254, 179, 230, 255),
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
                leading: const Icon(Icons.home),
                title: const Text(
                  "H O M E",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return const MainHome();
                  }));
                },
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text(
                  "P R O F I L E ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return const UserProfile();
                  }));
                },
              ),
              ListTile(
                leading: const Icon(Icons.bus_alert),
                title: const Text(
                  "A D M I N",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return const TransportWidgetDb();
                  }));
                },
              ),
              Expanded(
                  child: Container(
                height: 380,
              )),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text(
                  "L O G O U T ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.of(context).pop(MaterialPageRoute(builder: (_) {
                    return const LoginPage();
                  }));
                },
              ),
            ],
          ),
        ),
      ),
      body: Container(
        color: const Color.fromARGB(255, 179, 255, 224),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 30, 0, 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              slogn(),
              const SizedBox(
                height: 80,
              ),
              stwidet(),
              const SizedBox(
                height: 50,
              ),
              rdwidet(),
            ],
          ),
        ),
      ),
    );
  }
}
