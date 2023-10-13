import 'package:communal/utils/colors.dart';
import 'package:communal/widgets/button_widget.dart';
import 'package:communal/widgets/text_widget.dart';
import 'package:flutter/material.dart';

import 'aboutus_tab.dart';
import 'contactus_tab.dart';

class TreeparkTab extends StatelessWidget {
  const TreeparkTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 500,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/green.jpg'),
                  fit: BoxFit.cover),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          TextWidget(
            text: 'List of Rooms',
            fontSize: 18,
            fontFamily: 'Bold',
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 300,
                    height: 250,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/green.jpg'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextWidget(
                    text: 'GREEN HOUSE',
                    fontSize: 14,
                    color: Colors.grey,
                    fontFamily: 'Regular',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextWidget(
                    text: '1000 PHP/night good for 4-6 person',
                    fontSize: 18,
                    color: Colors.black,
                    fontFamily: 'Bold',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ButtonWidget(
                    color: primary,
                    radius: 100,
                    label: 'Book Now',
                    onPressed: () {},
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 300,
                    height: 250,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/duplex.jpg'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextWidget(
                    text: 'DUPLEX HOUSE',
                    fontSize: 14,
                    color: Colors.grey,
                    fontFamily: 'Regular',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextWidget(
                    text: '1500 PHP/night good for 6-8 person',
                    fontSize: 18,
                    color: Colors.black,
                    fontFamily: 'Bold',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ButtonWidget(
                    color: primary,
                    radius: 100,
                    label: 'Book Now',
                    onPressed: () {},
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 300,
                    height: 250,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/DOORM HOUSE.jpg'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextWidget(
                    text: 'DORM HOUSE',
                    fontSize: 14,
                    color: Colors.grey,
                    fontFamily: 'Regular',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextWidget(
                    text: '4000 PHP/night good for 15-20 person',
                    fontSize: 18,
                    color: Colors.black,
                    fontFamily: 'Bold',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ButtonWidget(
                    color: primary,
                    radius: 100,
                    label: 'Book Now',
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Divider(),
          const SizedBox(
            height: 20,
          ),
          TextWidget(
            text: 'About Us',
            fontSize: 32,
            color: Colors.black,
            fontFamily: 'Bold',
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(),
          const AboutUsTab(),
          const SizedBox(
            height: 20,
          ),
          const Divider(),
          const SizedBox(
            height: 20,
          ),
          TextWidget(
            text: 'Contact Us',
            fontSize: 32,
            color: Colors.black,
            fontFamily: 'Bold',
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(),
          ContactUs(),
        ],
      ),
    );
  }
}
