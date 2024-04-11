// ignore_for_file: camel_case_types, file_names, unused_import, unused_local_variable
import 'package:flutter/material.dart';
import 'package:green/profile.dart';
import 'package:green/ride_sharedb/return_ride.dart';
import 'package:green/ride_sharedb/share_button.dart';
import 'package:green/second_screens/database_servises.dart';
import 'package:green/second_screens/dbclasses.dart';
import 'package:green/second_screens/transport_schedule.dart';

class RideShare extends StatefulWidget {
  const RideShare({super.key});

  @override
  State<RideShare> createState() => _RideShareState();
}

class _RideShareState extends State<RideShare> {
  final RideDatabaseServises _databaseServises = RideDatabaseServises();
  final ReturnRideDatabaseServises _rdatabaseServises =
      ReturnRideDatabaseServises();

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
          stream: _databaseServises.getRide(),
          builder: (context, snapshot) {
            List rideShare = snapshot.data?.docs ?? [];
            if (rideShare.isEmpty) {
              return const Center(
                child: Text("Add a Transport Details"),
              );
            }
            return ListView.builder(
                itemCount: rideShare.length,
                itemBuilder: (context, index) {
                  RideSendDb rideID = rideShare[index].data();
                  String ridesID = rideShare[index].id;
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
                            _databaseServises.deleteRide(rideID as String);
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                rideID.DriversName,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  const Icon(Icons.location_on, size: 16),
                                  const SizedBox(width: 5),
                                  Text(rideID.RideLocation),
                                ],
                              ),
                              const SizedBox(height: 5),
                              Text(
                                rideID.VehicleNo,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                rideID.DriversPhone,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                rideID.VehicleModle,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                rideID.AvalibleSeats,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
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

//   R E T U R N            R I D E              D A T A B A S E

  Widget _rbuildUi() {
    return SafeArea(
        child: Column(
      children: [
        _rmessagesListView(),
      ],
    ));
  }

  Widget _rmessagesListView() {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.80,
      width: MediaQuery.sizeOf(context).width,
      child: StreamBuilder(
          stream: _rdatabaseServises.getReturnRide(),
          builder: (context, snapshot) {
            List rideShareReturn = snapshot.data?.docs ?? [];
            if (rideShareReturn.isEmpty) {
              return const Center(
                child: Text("Can You Give A Share Ride"),
              );
            }
            return ListView.builder(
                itemCount: rideShareReturn.length,
                itemBuilder: (context, index) {
                  ReturnRideSendDb rideIDr = rideShareReturn[index].data();
                  String ridesIDr = rideShareReturn[index].id;
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
                            _rdatabaseServises
                                .deleteReturnRide(rideIDr as String);
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                rideIDr.RDriversName,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  const Icon(Icons.location_on, size: 16),
                                  const SizedBox(width: 5),
                                  Text(rideIDr.RRideLocation),
                                ],
                              ),
                              const SizedBox(height: 5),
                              Text(
                                rideIDr.RVehicleNo,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                rideIDr.RDriversPhone,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                rideIDr.RVehicleModle,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                rideIDr.RAvalibleSeats,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
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
                      return const UserProfile();
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
                        return const UserProfile();
                      }));
                    },
                  ),
                ],
              ),
            ),
          ),
          body: TabBarView(children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) {
                        return const ShareButton();
                      }));
                    },
                    child: const SizedBox(
                      height: 20,
                      width: double.infinity,
                      child: Text(
                        "Share Ride",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 16),
                      child: _buildUi()),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) {
                        return const ReturnShareButton();
                      }));
                    },
                    child: const SizedBox(
                      height: 20,
                      width: double.infinity,
                      child: Text(
                        "Share Ride",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 16),
                      child: _rbuildUi()),
                ],
              ),
            ),
          ]),
        ));
  }
}
