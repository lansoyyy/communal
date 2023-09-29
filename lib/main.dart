import 'package:communal/screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          authDomain: 'communal-967dd.firebaseapp.com',
          apiKey: "AIzaSyBVOgJ1EtbTwu4NNEbktDsZ2ZKxyf5TepA",
          appId: "1:616439791851:web:0e282eb7f0ea621ca8feae",
          messagingSenderId: "616439791851",
          projectId: "communal-967dd",
          storageBucket: "communal-967dd.appspot.com"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'COMMUNAL RANCH & TREE PARK BOOKING SYSTEM',
      home: HomeScreen(),
    );
  }
}
