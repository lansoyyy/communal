import 'package:cloud_firestore/cloud_firestore.dart';

Future addBooking(name, number, email, address, nums, date, time, type, desc,
    payment, province, municipality, brgy) async {
  final docUser = FirebaseFirestore.instance.collection('Bookings').doc();

  final json = {
    'desc': desc,
    'name': name,
    'number': number,
    'email': email,
    'address': '$province, $municipality, $brgy',
    'nums': nums,
    'dateTime': DateTime.now(),
    'isSeen': false,
    'status': 'Pending',
    'date': date,
    'time': time,
    'type': type,
    'payment': payment
  };

  await docUser.set(json);
}
