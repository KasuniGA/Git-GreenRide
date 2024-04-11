import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> updateUserDetails(String userId, String name, String email, String contactNo) async {
    try {
      await _db.collection('users').doc(userId).update({
        'name': name,
        'email': email,
        'contactNo': contactNo,
      });
    } catch (e) {
      print('Error updating user details: $e');
    }
  }
}