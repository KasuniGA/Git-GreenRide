// ignore_for_file: camel_case_types, file_names, unused_import
import 'package:flutter/material.dart';
import 'package:green/profile.dart';
import 'package:green/second_screens/transport_schedule.dart';

class RideShare extends StatefulWidget {
  const RideShare({super.key});

  @override
  State<RideShare> createState() => _RideShareState();
}

class _RideShareState extends State<RideShare> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                      return const Profile();
                    }));
                  },
                  icon: const Icon(Icons.person))
            ],
            bottom: const TabBar(
              tabs: [Tab(text: "One Way"), Tab(text: "Return Way")],
            ),
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
                    title: const Text("User"),
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) {
                        return const TransportSchedule();
                      }));
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.home),
                    title: const Text("Home"),
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) {
                        return const Profile();
                      }));
                    },
                  ),
                ],
              ),
            ),
          ),
          body: const TabBarView(children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Pick Up Location',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Drop Location',
                    ),
                  ),
                ),
              ],
            ),
          ]),
        ));
  }
}
