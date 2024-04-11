// import 'package:cloud_firestore/cloud_firestore.dart';
// ignore_for_file: unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:green/Main/login_form.dart';
import 'package:green/profile.dart';
import 'package:green/ride_sharedb/ride_share.dart';
import 'package:green/second_screens/database_servises.dart';
import 'package:green/second_screens/dbclasses.dart';
import 'package:green/second_screens/transport_widget.dart';

class TransportSchedule extends StatefulWidget {
  const TransportSchedule({super.key});

  @override
  State<TransportSchedule> createState() => _TransportScheduleState();
}

class _TransportScheduleState extends State<TransportSchedule> {
  final DatabaseServises _databaseServises = DatabaseServises();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      return const TransportWidgetDb();
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
                  leading: const Icon(Icons.person),
                  title: const Text("Profile"),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                      return const UserProfile();
                    }));
                  },
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          title: const Text("Transport Schedule"),
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
        body: _buildUi());
      }

  Widget _buildUi() {
    return SafeArea(
        child: Column(
      children: [
        _messagesListView(),
      ],
    ));
  }

  Widget _messagesListView() {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.80,
      width: MediaQuery.sizeOf(context).width,
      child: StreamBuilder(
          stream: _databaseServises.getTransport(),
          builder: (context, snapshot) {
            List transport = snapshot.data?.docs ?? [];
            if (transport.isEmpty) {
              return const Center(
                child: Text("Add a Transport Details"),
              );
            }
            return ListView.builder(
                itemCount: transport.length,
                itemBuilder: (context, index) {
                  TransportSendDb transportID = transport[index].data();
                  String transpoartsID = transport[index].id;
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: GestureDetector(
                          onLongPress: () {
                            _databaseServises.deleteTransport(transportID as String);
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                transportID.BusRoute,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  const Icon(Icons.location_on, size: 16),
                                  const SizedBox(width: 5),
                                  Text(transportID.WhereTo),
                                ],
                              ),
                              const SizedBox(height: 5),
                              Text(transportID.Time),
                            ],
                            
                          ),
                        ),
                      ),
                    ),
                  );
                });
          }),
    );
  }
}
