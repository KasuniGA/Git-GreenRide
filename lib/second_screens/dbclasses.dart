// ignore_for_file: non_constant_identifier_names, unused_import

//import 'package:cloud_firestore/cloud_firestore.dart';

import 'dart:ffi';

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
          BusRoute: json['BusRoute']! as String,
          WhereTo: json['WhereTo']! as String,
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
      'BusRoute': BusRoute,
      'WhereTo': WhereTo,
      'Time': Time,
    };
  }
}

class RideSendDb {
  final String DriversName;
  final String DriversPhone;
  final String VehicleNo;
  final String RideLocation;
  final String VehicleModle;
  final String AvalibleSeats;

  RideSendDb({
    required this.DriversName,
    required this.DriversPhone,
    required this.VehicleNo,
    required this.RideLocation,
    required this.VehicleModle,
    required this.AvalibleSeats,
  });

  factory RideSendDb.fromJson(Map<String, Object?> json) {
    return RideSendDb(
      DriversName: json['DriversName'] as String? ?? 'Default Name',
      DriversPhone: json['DriversPhone'] as String? ?? 'Default Phone',
      VehicleNo: json['VehicleNo'] as String? ?? 'Default Vehicle No',
      RideLocation: json['RideLocation'] as String? ?? 'Default Location',
      VehicleModle: json['VehicleModle'] as String? ?? 'Default Model',
      AvalibleSeats: json['AvalibleSeats'] as String? ?? 'Default Seats',
    );
  }

  RideSendDb copyWith({
    String? DriversName,
    String? DriversPhone,
    String? VehicleNo,
    String? RideLocation,
    String? VehicleModle,
    String? AvalibleSeats,
  }) {
    return RideSendDb(
      DriversName: DriversName ?? this.DriversName,
      DriversPhone: DriversPhone ?? this.DriversPhone,
      VehicleNo: VehicleNo ?? this.VehicleNo,
      RideLocation: RideLocation ?? this.RideLocation,
      VehicleModle: VehicleModle ?? this.VehicleModle,
      AvalibleSeats: AvalibleSeats ?? this.AvalibleSeats,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'DriversName': DriversName,
      'DriversPhone': DriversPhone,
      'VehicleNo': VehicleNo,
      'RideLocation': RideLocation,
      'VehicleModle': VehicleModle,
      'AvalibleSeats': AvalibleSeats,
    };
  }
}


class ReturnRideSendDb {
  final String RDriversName;
  final String RDriversPhone;
  final String RVehicleNo;
  final String RRideLocation;
  final String RVehicleModle;
  final String RAvalibleSeats;

  ReturnRideSendDb({
    required this.RDriversName,
    required this.RDriversPhone,
    required this.RVehicleNo,
    required this.RRideLocation,
    required this.RVehicleModle,
    required this.RAvalibleSeats,
  });

  factory ReturnRideSendDb.fromJson(Map<String, Object?> json) {
    return ReturnRideSendDb(
      RDriversName: json['RDriversName'] as String? ?? 'Default Name',
      RDriversPhone: json['RDriversPhone'] as String? ?? 'Default Phone',
      RVehicleNo: json['RVehicleNo'] as String? ?? 'Default Vehicle No',
      RRideLocation: json['RRideLocation'] as String? ?? 'Default Location',
      RVehicleModle: json['RVehicleModle'] as String? ?? 'Default Model',
      RAvalibleSeats: json['RAvalibleSeats'] as String? ?? 'Default Seats',
    );
  }

  ReturnRideSendDb copyWith({
    String? RDriversName,
    String? RDriversPhone,
    String? RVehicleNo,
    String? RRideLocation,
    String? RVehicleModle,
    String? RAvalibleSeats,
  }) {
    return ReturnRideSendDb(
      RDriversName: RDriversName ?? this.RDriversName,
      RDriversPhone: RDriversPhone ?? this.RDriversPhone,
      RVehicleNo: RVehicleNo ?? this.RVehicleNo,
      RRideLocation: RRideLocation ?? this.RRideLocation,
      RVehicleModle: RVehicleModle ?? this.RVehicleModle,
      RAvalibleSeats: RAvalibleSeats ?? this.RAvalibleSeats,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'DriversName': RDriversName,
      'DriversPhone': RDriversPhone,
      'VehicleNo': RVehicleNo,
      'RideLocation': RRideLocation,
      'VehicleModle': RVehicleModle,
      'AvalibleSeats': RAvalibleSeats,
    };
  }
}