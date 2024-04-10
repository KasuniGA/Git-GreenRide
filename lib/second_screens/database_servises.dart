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
}
