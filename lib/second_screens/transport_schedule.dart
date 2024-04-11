// import 'package:cloud_firestore/cloud_firestore.dart';
// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:green/home_page/main_home.dart';
import 'package:green/profile.dart';
import 'package:green/second_screens/database_servises.dart';
import 'package:green/second_screens/dbclasses.dart';

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
            color: const Color.fromARGB(255, 153, 255, 235),
            child: ListView(
              children: [
                const DrawerHeader(
                    child: Center(
                  child: Text(
                    "G R E E N  R I D E  M E N U",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
                    "P R O F I L E",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
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
          actions: const [
            Image(
                image:
                    AssetImage("assets/logo_trial-VqAv6Aw70-transformed.png"))
          ],
        ),
        body: _buildUi());
  }

  Widget _buildUi() {
    return SafeArea(
        child: Container(
      color: const Color.fromARGB(255, 179, 255, 224),
      child: Column(
        children: [
          _messagesListView(),
        ],
      ),
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
                      color: const Color.fromARGB(255, 0, 156, 102),
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: GestureDetector(
                          onLongPress: () {
                            _databaseServises
                                .deleteTransport(transportID as String);
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
