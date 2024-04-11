import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:green/ride_sharedb/ride_share.dart';

class ReturnShareButton extends StatefulWidget {
  const ReturnShareButton({super.key});

  @override
  State<ReturnShareButton> createState() => _ReturnShareButtonState();
}

class _ReturnShareButtonState extends State<ReturnShareButton> {
  final GlobalKey<FormState> _ridebutton = GlobalKey<FormState>();

  final rvehicleno = TextEditingController();
  final rdriverphoneno = TextEditingController();
  final rdname = TextEditingController();
  final rvehiclemodle = TextEditingController();
  final rfromroute = TextEditingController();
  final ravalibleseats = TextEditingController();

  Future sride() async {
    await FirebaseFirestore.instance.collection('ridesharereturn').add({
      'VehicleNo': rvehicleno.text,
      'DriverPhone': rdriverphoneno.text,
      'DriverName': rdname.text,
      'VehicleModle': rvehiclemodle.text,
      'AvalibleSeats': ravalibleseats.text,
      'RideLocation': rfromroute.text,
    });
  }

  Widget _vehicleNo() {
    return TextFormField(
      controller: rvehicleno,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Enter bus ',
      ),
    );
  }

  Widget _driverName() {
    return TextFormField(
      controller: rdname,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Where to',
      ),
    );
  }

  Widget _pgoneNo() {
    return TextFormField(
      controller: rdriverphoneno,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Enter Time',
      ),
    );
  }

  Widget _avalaibleSeats() {
    return TextFormField(
      controller: ravalibleseats,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Enter bus ',
      ),
    );
  }

  Widget _vehicleModle() {
    return TextFormField(
      controller: rvehiclemodle,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Where to',
      ),
    );
  }

  Widget _fromRoute() {
    return TextFormField(
      controller: rfromroute,
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
            key: _ridebutton,
            child: Container(
              margin: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const Center(
                    child: Text(
                      "Enter Ride Details",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 16),
                    child: _vehicleNo(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 16),
                    child: _driverName(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 16),
                    child: _pgoneNo(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 16),
                    child: _avalaibleSeats(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 16),
                    child: _vehicleModle(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 16),
                    child: _fromRoute(),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 30.0, top: 15.0),
                      child: ElevatedButton(
                          onPressed: () {
                            sride();
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (_) {
                              return const RideShare();
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

  @override
  void dispose() {
    rvehicleno.dispose();
    rdriverphoneno.dispose();
    rdname.dispose();
    rvehiclemodle.dispose();
    rfromroute.dispose();
    ravalibleseats.dispose();
    super.dispose();
  }
}
