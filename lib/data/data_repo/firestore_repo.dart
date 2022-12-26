import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smoke_polution_monitoring/data/model/sps30.dart';

class FirestoreRepo {
  final CollectionReference spsCollection =
      FirebaseFirestore.instance.collection('sps30');

  final CollectionReference spsStreamCollection =
      FirebaseFirestore.instance.collection('sps30Stream');

  Stream<List<Sps30>> listDataLimit(int limit) {
    return spsCollection
        .orderBy('date', descending: false)
        .limit(limit)
        .snapshots()
        .map(_dataListFromSnapshot);
  }

  Stream<List<Sps30>> listDataFull(int limit) {
    return spsCollection
        .orderBy('date', descending: true)
        .snapshots()
        .map(_dataListFromSnapshot);
  }

  Stream<Sps30> streamSps() {
    return spsStreamCollection
        .doc('data')
        .snapshots()
        .map((doc) => Sps30.fromFirestore(doc));
  }

  List<Sps30> _dataListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) => Sps30.fromFirestore(doc)).toList();
  }
}
