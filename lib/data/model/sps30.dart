import 'package:cloud_firestore/cloud_firestore.dart';

class Sps30 {
  final double? nc0Dot5;
  final double? nc1Dot0;
  final double? nc10Dot0;
  final double? nc2Dot5;
  final double? nc4dot0;
  final double? pm1dot0;
  final double? pm10dot0;
  final double? pm2dot5;
  final double? pm4dot0;
  final double? particleSize;
  final DateTime? date;
  final DocumentSnapshot? snapshot;
  final DocumentReference? reference;
  final String? documentID;

  Sps30({
    this.nc0Dot5,
    this.nc1Dot0,
    this.nc10Dot0,
    this.nc2Dot5,
    this.nc4dot0,
    this.pm1dot0,
    this.pm10dot0,
    this.pm2dot5,
    this.pm4dot0,
    this.particleSize,
    this.date,
    this.snapshot,
    this.reference,
    this.documentID,
  });

  factory Sps30.fromFirestore(DocumentSnapshot snapshot) {
    dynamic map = snapshot.data();

    return Sps30(
      nc0Dot5: double.parse(map['NC0.5']),
      nc1Dot0: double.parse(map['NC1.0']),
      nc10Dot0: double.parse(map['NC10.0']),
      nc2Dot5: double.parse(map['NC2.5']),
      nc4dot0: double.parse(map['NC4.0']),
      pm1dot0: double.parse(map['PM1.0']),
      pm10dot0: double.parse(map['PM10.0']),
      pm2dot5: double.parse(map['PM2.5']),
      pm4dot0: double.parse(map['PM4.0']),
      particleSize: double.parse(map['particle_size']),
      date: DateTime.parse((map['date']).toDate().toString()),
      snapshot: snapshot,
      reference: snapshot.reference,
      documentID: snapshot.id,
    );
  }

  // factory Sps30.fromMap(Map<String, dynamic> map) {
  //   return Sps30(
  //     nc0Dot5: map['nc0Dot5'],
  //     nc1Dot0: map['nc1Dot0'],
  //     nc10Dot0: map['nc10Dot0'],
  //     nc2Dot5: map['nc2Dot5'],
  //     nc4dot0: map['nc4dot0'],
  //     pm1dot0: map['pm1dot0'],
  //     pm10dot0: map['pm10dot0'],
  //     pm2dot5: map['pm2dot5'],
  //     pm4dot0: map['pm4dot0'],
  //     particleSize: map['particle_size'],
  //   );
  // }

  Map<String, dynamic> toMap() => {
        'NCO.5': nc0Dot5,
        'NC1.0': nc1Dot0,
        'NC10.0': nc10Dot0,
        'NC2.5': nc2Dot5,
        'NC4.0': nc4dot0,
        'PM1.0': pm1dot0,
        'PM10.0': pm10dot0,
        'PM2.5': pm2dot5,
        'PM4.0': pm4dot0,
        'particle_size': particleSize,
        'date': FieldValue.serverTimestamp(),
      };

  @override
  String toString() {
    return '${nc0Dot5.toString()}, ${nc1Dot0.toString()}, ${nc10Dot0.toString()}, ${nc2Dot5.toString()}, ${nc4dot0.toString()}, ${pm1dot0.toString()}, ${pm10dot0.toString()}, ${pm2dot5.toString()}, ${pm4dot0.toString()}, ${particleSize.toString()}, ';
  }

  @override
  bool operator ==(other) => other is Sps30 && documentID == other.documentID;

  int get hashCode => documentID.hashCode;
}
