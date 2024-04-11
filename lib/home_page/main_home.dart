// ignore_for_file: unnecessary_import

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
        child: const SizedBox(
          height: 150,
          width: 300,
          child: Card(
            color: Colors.grey,
            child: SizedBox(
              height: 200,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      "Transport Schedules",
                      style: TextStyle(fontSize: 30),
                      textAlign: TextAlign.center,
                    ),
                    Icon(Icons.arrow_forward)
                  ],
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

  Widget ndwidet() {
    return Center(
      child: GestureDetector(
        child: const SizedBox(
          height: 150,
          width: 300,
          child: Card(
            color: Colors.grey,
            child: SizedBox(
              height: 200,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      "Transport Schedules",
                      style: TextStyle(fontSize: 30),
                      textAlign: TextAlign.center,
                    ),
                    Icon(Icons.arrow_forward)
                  ],
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
        child: const SizedBox(
          height: 150,
          width: 300,
          child: Card(
            color: Colors.grey,
            child: SizedBox(
              height: 200,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      "Ride Sharing",
                      style: TextStyle(fontSize: 30),
                      textAlign: TextAlign.center,
                    ),
                    Icon(Icons.arrow_forward)
                  ],
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.of(context).pop(MaterialPageRoute(builder: (_) {
                return const LoginPage();
              }));
            },
          ),
        ],
      ),
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
                title: const Text("Profile"),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return const UserProfile();
                  }));
                },
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text("Home"),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return const RideShare();
                  }));
                },
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text("DB WEIde"),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return const TransportWidgetDb();
                  }));
                },
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 30, 0, 15),
        child: Column(
          children: [
            stwidet(),
            const SizedBox(
              height: 50,
            ),
            ndwidet(),
            const SizedBox(
              height: 50,
            ),
            rdwidet(),
          ],
        ),
      ),
    );
  }
}
