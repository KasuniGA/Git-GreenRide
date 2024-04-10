// ignore_for_file: non_constant_identifier_names, unused_import

//import 'package:cloud_firestore/cloud_firestore.dart';

class TransportSendDb {
  final String BusRoute;
  final String WhereTo;
  final String Time;

  TransportSendDb({
    required this.BusRoute,
    required this.WhereTo,
    required this.Time,
  });

  TransportSendDb.fromJson(Map<String, Object?> json)
      : this(
          BusRoute: json['Bus_Route']! as String,
          WhereTo: json['Where_To']! as String,
          Time: json['Time']! as String,
        );

  TransportSendDb copyWith({
    String? BusRoute,
    String? WhereTo,
    String? Time,
  }) {
    return TransportSendDb(
        BusRoute: BusRoute ?? this.BusRoute,
        WhereTo: WhereTo ?? this.WhereTo,
        Time: Time ?? this.Time);
  }

  Map<String, Object?> toJson() {
    return {
      'Bus_Route': BusRoute,
      'Where_To': WhereTo,
      'Time': Time,
    };
  }
}
