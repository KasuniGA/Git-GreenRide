// ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names, constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:green/second_screens/dbclasses.dart';
// import 'package:green/second_screens/transport_widget.dart';

const String TRANSPORT_COLL_REF = "transport";

class DatabaseServises {
  final _firestore = FirebaseFirestore.instance;

  late final CollectionReference _transportRef;

  DatabaseServises() {
    _transportRef = _firestore
        .collection(TRANSPORT_COLL_REF)
        .withConverter<TransportSendDb>(
            fromFirestore: (snapshots, _) => TransportSendDb.fromJson(
                  snapshots.data()!,
                ),
            toFirestore: (TransportSendDb, _) => TransportSendDb.toJson());
  }

  Stream<QuerySnapshot> getTransport() {
    return _transportRef.snapshots();
  }

  void addTransport(TransportSendDb transports) async {
    _transportRef.add(transports);
  }

  void deleteTransport(String transportsID) {
    _transportRef.doc(transportsID).delete();
  }
}


//   R I D E          D A T A B A S E 


const String RIDE_COLL_REF = "rideshare";

class RideDatabaseServises {
  final _firestore = FirebaseFirestore.instance;

  late final CollectionReference _rideRef;

  RideDatabaseServises() {
    _rideRef = _firestore.collection(RIDE_COLL_REF).withConverter<RideSendDb>(
        fromFirestore: (snapshots, _) => RideSendDb.fromJson(
              snapshots.data()!,
            ),
        toFirestore: (RideSendDb, _) => RideSendDb.toJson());
  }

  Stream<QuerySnapshot> getRide() {
    return _rideRef.snapshots();
  }

  void addRide(RideSendDb rides) async {
    _rideRef.add(rides);
  }

  void deleteRide(String ridesID) {
    _rideRef.doc(ridesID).delete();
  }
}


//  R E T U R N      R I D E        D A T A B A S E 
const String RETURN_RIDE_COLL_REF = "ridesharereturn";

class ReturnRideDatabaseServises {
  final _firestore = FirebaseFirestore.instance;

  late final CollectionReference _returnrideRef;

  ReturnRideDatabaseServises() {
    _returnrideRef = _firestore.collection(RETURN_RIDE_COLL_REF).withConverter<ReturnRideSendDb>(
        fromFirestore: (snapshots, _) => ReturnRideSendDb.fromJson(
              snapshots.data()!,
            ),
        toFirestore: (ReturnRideSendDb, _) => ReturnRideSendDb.toJson());
  }

  Stream<QuerySnapshot> getReturnRide() {
    return _returnrideRef.snapshots();
  }

  void addReturnRide(RideSendDb ridesr) async {
    _returnrideRef.add(ridesr);
  }

  void deleteReturnRide(String ridesIDr) {
    _returnrideRef.doc(ridesIDr).delete();
  }
}

//        P R O F I L E            P A G E 

//userData from snapshot
  