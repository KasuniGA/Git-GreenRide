// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// class MapScreen extends StatefulWidget {
//   const MapScreen({super.key});
//
//   @override
//   State<MapScreen> createState() => _MapScreenState();
// }
// //String mapkey = "AIzaSyBYBzcQm4QDrdE-kt83bmqn9joLYdAzU8o";
//
// class _MapScreenState extends State<MapScreen> {
//
//   // LatLng? pickLocation;
//   // loc.Location location = loc.Location();
//
//   static const LatLng _pGooglePlex = LatLng(6.910258, 79.952574);
//
//   final Completer<GoogleMapController> _controllerGoogleMap =
//   Completer<GoogleMapController>();
//
//   static const CameraPosition _kGooglePlex = CameraPosition(
//     target: LatLng(37.42796133580664, -122.085749655962),
//     zoom: 14.4746,
//   );
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: const GoogleMap(
//           initialCameraPosition: CameraPosition(
//               target: _pGooglePlex,
//               zoom: 16)
//           ),
//     );
//   }
// }


// // // ignore_for_file: unused_field

// // ignore_for_file: unused_field

// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class MapScreen extends StatefulWidget {
//   const MapScreen({super.key});

//   @override
//   State<MapScreen> createState() => _MapScreenState();
// }
// //String mapkey = "AIzaSyBYBzcQm4QDrdE-kt83bmqn9joLYdAzU8o";

// class _MapScreenState extends State<MapScreen> {

//   // LatLng? pickLocation;
//   // loc.Location location = loc.Location();

//   static const LatLng _pGooglePlex = LatLng(6.910258, 79.952574);

//   final Completer<GoogleMapController> _controllerGoogleMap =
//   Completer<GoogleMapController>();

//   static const CameraPosition _kGooglePlex = CameraPosition(
//     target: LatLng(37.42796133580664, -122.085749655962),
//     zoom: 14.4746,
//   );

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: const GoogleMap(
//           initialCameraPosition: CameraPosition(
//               target: _pGooglePlex,
//               zoom: 16)
//           ),
//     );
//   }
// }


import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:location/location.dart' as loc;

String mapkey = "AIzaSyBYBzcQm4QDrdE-kt83bmqn9joLYdAzU8o";

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng? picklocation;
  //loc.Location location = loc.Location();
  String? _address;

  final Completer<GoogleMapController> _controllerGoogleMap = Completer();
  GoogleMapController? newGoogleMapController;

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  double searchLocationContainerHeight = 220;
  double waitingResponsefromDriverContainerHeight = 0;
  double assignedDriverInfoContainerHeight = 0;

  Position? usercurrentPosition;
  var geoLocation = Geolocator();

  LocationPermission? _locationPermission;
  double bottomPaddingofMap = 0;

  List<LatLng> pLineCoordinatedList = [];
  Set<Polyline> polylineSet = {};

  Set<Marker> markersSet = {};
  Set<Circle> circlesSet = {};

  String userName = "";
  String userEmail = "";

  bool openNavigationDrawer = true;

  bool activeNearbyDriverKeysLoaded = false;

  BitmapDescriptor? activeNearbyIcon;

  locateUserPosition() async {
    Position cPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    usercurrentPosition = cPosition;

    LatLng latLngPosition =
    LatLng(usercurrentPosition!.latitude, usercurrentPosition!.longitude);

    CameraPosition cameraPosition =
    CameraPosition(target: latLngPosition, zoom: 15);

    newGoogleMapController!
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));

    //String humanReadableAddress = await
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Stack(
          children: [
            GoogleMap(
              mapType: MapType.normal,
              myLocationButtonEnabled: true,
              zoomGesturesEnabled: true,
              zoomControlsEnabled: true,
              initialCameraPosition: _kGooglePlex,
              polylines: polylineSet,
              markers: markersSet,
              circles: circlesSet,
              onMapCreated: (GoogleMapController controller) {
                _controllerGoogleMap.complete(controller);
                newGoogleMapController = controller;

                setState(() {});
                locateUserPosition();
              },
              onCameraMove: (CameraPosition? Position) {
                if (picklocation != Position!.target) {
                  setState(() {
                    picklocation = Position.target;
                  });
                }
              },
              onCameraIdle: () {
                //getAddressFromLatlng();
              },
            )
          ],
        ),
      ),
    );
  }
}
