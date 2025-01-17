//This Fille have the code for my Student's Record Database Project
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {

  Future addStudents(Map<String, dynamic> StudentInfo, String id) async {
    return await FirebaseFirestore.instance
        .collection("Students")
        .doc(id)
        .set(StudentInfo);
  }
  Future<Stream<QuerySnapshot>> getStudentsDetails() async {
    return FirebaseFirestore.instance.collection("Students").snapshots();
  }

  Future<void> deleteStudentInfo(String id) async {
    return await FirebaseFirestore.instance
        .collection("Students")
        .doc(id)
        .delete();
  }

  Future<void> updateStudentData(String id, Map<String, dynamic> updatedData) async {
    return await FirebaseFirestore.instance
        .collection("Students")
        .doc(id)
        .update(updatedData);
  }
}
