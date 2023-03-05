import 'package:clash_of_codes/models/model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

Future addUser(String name, String email, String id, String location, int age, String gender, int phone, var pref, var likes) async{
  final docUser = FirebaseFirestore.instance.collection("users").doc("102");
  final user = User(name: name, email: email, id: id, location: location, age: age, gender: gender, phone: phone, rating: 0, activity_status: 0, pref: pref, likes: likes);
  final json = user.toJson();

  await docUser.set(json);
}

Future<List<dynamic>> getPref(String id) async {

  FirebaseFirestore.instance.collection("users").doc(id).get().then((DocumentSnapshot doc) {
      final data = doc.data() as Map<String, dynamic>;
      return (data['pref']);
    },
    onError: (e) => print("Error getting document: $e"),
  );
  return [];
}

Future<String> getName(String id) async {

  FirebaseFirestore.instance.collection("users").doc(id).get().then(  (DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    print(data['name']);
  },
    onError: (e) => print("Error getting document: $e"),
  );
  return 'aa';
}
