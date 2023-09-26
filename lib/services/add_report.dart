import 'package:cloud_firestore/cloud_firestore.dart';

Future addReport(name, msg, email) async {
  final docUser = FirebaseFirestore.instance.collection('Reports').doc();

  final json = {
    'name': name,
    'email': email,
    'msg': msg,
    'dateTime': DateTime.now(),
    'isSeen': false,
  };

  await docUser.set(json);
}
