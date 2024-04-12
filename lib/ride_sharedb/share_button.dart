import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:green/ride_sharedb/ride_share.dart';

class ShareButton extends StatefulWidget {
  const ShareButton({super.key});

  @override
  State<ShareButton> createState() => _ShareButtonState();
}

class _ShareButtonState extends State<ShareButton> {
  final GlobalKey<FormState> _ridebutton = GlobalKey<FormState>();

  final vehicleno = TextEditingController();
  final driverphoneno = TextEditingController();
  final dname = TextEditingController();
  final vehiclemodle = TextEditingController();
  final fromroute = TextEditingController();
  final avalibleseats = TextEditingController();

  Future sride() async {
    await FirebaseFirestore.instance.collection('rideshare').add({
      'VehicleNo': vehicleno.text,
      'DriverPhone': driverphoneno.text,
      'DriverName': dname.text,
      'VehicleModle': vehiclemodle.text,
      'AvalibleSeats': avalibleseats.text,
      'RideLocation': fromroute.text,
    });
  }

  Widget _vehicleNo() {
    return TextFormField(
      controller: vehicleno,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Vehicle No ',
      ),
    );
  }

  Widget _driverName() {
    return TextFormField(
      controller: dname,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Drivers Name',
      ),
    );
  }

  Widget _pgoneNo() {
    return TextFormField(
      controller: driverphoneno,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Mobile Number',
      ),
    );
  }

  Widget _avalaibleSeats() {
    return TextFormField(
      controller: avalibleseats,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Avalible Seats For Sharing ',
      ),
    );
  }

  Widget _vehicleModle() {
    return TextFormField(
      controller: vehiclemodle,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Vehicle Modle : ',
      ),
    );
  }

  Widget _fromRoute() {
    return TextFormField(
      controller: fromroute,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'From Locatin',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: const Color.fromARGB(250, 153, 221, 255),
        child: SingleChildScrollView(
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
                        child: SizedBox(
                          width: 340,
                          height: 60,
                          child: ElevatedButton(
                              onPressed: () {
                                sride();
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (_) {
                                  return const RideShare();
                                }));
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(250, 0, 77, 153),
                              ),
                              child: const Text(
                                "ADD",
                                style: TextStyle(color: Colors.white),
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }

  @override
  void dispose() {
    vehicleno.dispose();
    driverphoneno.dispose();
    dname.dispose();
    vehiclemodle.dispose();
    fromroute.dispose();
    avalibleseats.dispose();
    super.dispose();
  }
}
