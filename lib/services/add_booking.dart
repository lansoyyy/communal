import 'package:cloud_firestore/cloud_firestore.dart';

Future addBooking(name, number, email, address, nums, date, time) async {
  final docUser = FirebaseFirestore.instance.collection('Bookings').doc();

  final json = {
    'name': name,
    'number': number,
    'email': email,
    'address': address,
    'nums': nums,
    'dateTime': DateTime.now(),
    'isSeen': false,
    'status': 'Pending',
    'date': date,
    'time': time
  };

  await docUser.set(json);
}
