import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:green/second_screens/transport_schedule.dart';

class TransportWidgetDb extends StatefulWidget {
  const TransportWidgetDb({super.key});

  @override
  State<TransportWidgetDb> createState() => _TransportWidgetDbState();

  toJson() {}

  static fromJson(Map<String, dynamic> map) {}
}

class _TransportWidgetDbState extends State<TransportWidgetDb> {
  final GlobalKey<FormState> _transportform = GlobalKey<FormState>();

  final busWhereTo = TextEditingController();
  final whatTime = TextEditingController();
  final busRoute = TextEditingController();

  Future sendData() async {
    await FirebaseFirestore.instance.collection('users').add({
      'BusRoute': busRoute.text,
      'WhereTo': busWhereTo.text,
      'Time': whatTime.text,
    });
  }

  Widget _busroute() {
    return TextFormField(
      controller: busRoute,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Enter bus route',
      ),
    );
  }

  Widget _whereto() {
    return TextFormField(
      controller: busWhereTo,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Where to',
      ),
    );
  }

  Widget _time() {
    return TextFormField(
      controller: whatTime,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Enter Time',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Form(
            key: _transportform,
            child: Container(
              margin: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const Center(
                    child: Text(
                      "Enter Transport Details",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 16),
                    child: _busroute(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 16),
                    child: _whereto(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 16),
                    child: _time(),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 30.0, top: 15.0),
                      child: ElevatedButton(
                          onPressed: () {
                            sendData();
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (_) {
                              return const TransportSchedule();
                            }));
                          },
                          child: const Text("Send Data")),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
