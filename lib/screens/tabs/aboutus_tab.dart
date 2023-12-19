import 'package:flutter/material.dart';

import '../../widgets/text_widget.dart';

class AboutUsTab extends StatelessWidget {
  const AboutUsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('assets/images/logo.png'),
              // Replace with your own image
            ),
            const SizedBox(height: 20),
            const Text(
              'Our Company',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'We are a creative team of developers and designers.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Our Mission',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'To create innovative solutions that make a difference.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Contact Us',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Email: contact@example.com\nPhone: +1 (123) 456-7890',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextWidget(
                      text: 'Mission',
                      fontSize: 28,
                      color: Colors.black,
                      fontFamily: 'Bold',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 500,
                      child: TextWidget(
                        text:
                            'An ecologically balance place, Tribal Capital of Bukidnon and Home of the Country’s Finest Cowboys with sustainable, agri-industrial and ecotourism economy, God Loving and health reliant community with accountable, transparent and responsive governance.',
                        fontSize: 14,
                        color: Colors.grey,
                        fontFamily: 'Regular',
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextWidget(
                      text: 'Vission',
                      fontSize: 28,
                      color: Colors.black,
                      fontFamily: 'Bold',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 500,
                      child: TextWidget(
                        text:
                            'The Municipal Government of Impasugong shall promote sustainable agri-industrial and ecotourism economy in harmony with nature, deliver the basic services thru the good governance to general welfare of its people.',
                        fontSize: 14,
                        color: Colors.grey,
                        fontFamily: 'Regular',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
