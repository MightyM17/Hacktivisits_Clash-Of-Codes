import 'package:clash_of_codes/models/model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future addUser(String id, String name, String email) async{
  final docUser = FirebaseFirestore.instance.collection("users").doc(id);
  final user = User(id: id, name: name, email: email);
  final json = user.toJson();

  await docUser.set(json);
}
