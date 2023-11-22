import 'package:communal/services/add_report.dart';
import 'package:communal/widgets/toast_widget.dart';
import 'package:flutter/material.dart';

class ContactUs extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController messageController = TextEditingController();
  final TextEditingController numberController = TextEditingController();

  ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 800),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: nameController,
              style: const TextStyle(
                color: Colors.black,
              ),
              decoration: const InputDecoration(
                labelStyle: TextStyle(color: Colors.black),
                labelText: 'Your Name',
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: emailController,
              style: const TextStyle(
                color: Colors.black,
              ),
              decoration: const InputDecoration(
                labelStyle: TextStyle(color: Colors.black),
                labelText: 'Your Email',
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: numberController,
              style: const TextStyle(
                color: Colors.black,
              ),
              decoration: const InputDecoration(
                labelStyle: TextStyle(color: Colors.black),
                labelText: 'Phone Number',
                prefixIcon: Icon(
                  Icons.phone,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: messageController,
              maxLines: 4,
              style: const TextStyle(
                color: Colors.black,
              ),
              decoration: const InputDecoration(
                labelStyle: TextStyle(color: Colors.black),
                labelText: 'Your Message',
                prefixIcon: Icon(
                  Icons.message,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                addReport(nameController.text, messageController.text,
                    emailController.text, numberController.text);
                showToast('Your message was sent!');

                nameController.clear();
                messageController.clear();
                emailController.clear();
                // Handle form submission here
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
              ),
              child: const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  'Submit',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
