import 'package:cloud_firestore/cloud_firestore.dart';

Future addActivity(name, desc, img, date, time, type) async {
  final docUser = FirebaseFirestore.instance.collection('Activities').doc();

  final json = {
    'name': name,
    'desc': desc,
    'img': img,
    'date': date,
    'time': time,
    'type': type,
    'dateTime': DateTime.now(),
    'isSeen': false,
  };

  await docUser.set(json);
}
