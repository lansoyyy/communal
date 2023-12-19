import 'package:communal/screens/tabs/aboutus_tab.dart';
import 'package:communal/screens/tabs/contactus_tab.dart';
import 'package:flutter/material.dart';

import '../../widgets/text_widget.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: 500,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 500,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/home background.jpg'),
                    fit: BoxFit.cover),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextWidget(
                    text:
                        'Experience impasugong communal ranch and tree park booking system with virtual tour.',
                    fontSize: 32,
                    color: Colors.black,
                    fontFamily: 'Medium',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextWidget(
                    text: 'Communal Ranch and Tree Park',
                    fontSize: 48,
                    color: Colors.black,
                    fontFamily: 'Bold',
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextWidget(
                    text:
                        'Sikay  migmugna daw nag duma-duma poon ta tigpandya  daw desinyo Para mag mugna hu lain ha kasulbaran ha hura iling ( mao ni ipuli atong isa ka mission ug vission nga gi buhat nimo ) ',
                    fontSize: 12,
                    color: Colors.grey,
                    fontFamily: 'Medium',
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextWidget(
                  text: 'A Full Service Experience',
                  fontSize: 32,
                  color: Colors.black,
                  fontFamily: 'Bold',
                ),
                const SizedBox(
                  height: 20,
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
                          width: 500,
                          height: 250,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/impasugong ranch.jpg'),
                                fit: BoxFit.cover),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextWidget(
                          text: 'Communal Ranch',
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
                                'The communal ranch with the picture perfect landscape, there were many outdoor activities such as camping, horse back riding and etc. this vast  643 hectare grazing land is a haven for both animals and people. As far as the eye can see, lush green pastures stretch out in the distance, dotted with well bred cattle and horse grazers. The ranch features a captivating heart-shaped lake, a part from the mountain backdrop and wildflowers ',
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
                        Container(
                          width: 500,
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
                          text: 'Treepark',
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
                                'Tree park is the newly open tourist attraction located at Impasugong Bukidnon.The Municipality of Impasugong is strategically located in the north eastern part of the province of Bukidnon. the Municipality is known as the tribal capital of bukidnon and the home of the finest cowboys.The municipal tree park is a 10 hectare area fully planted with different species of trees namely Gemelina,Mahogany, Molave,Lauan and Nara. it has 3 cottages to shelter the visitors with available training center and dormitory',
                            fontSize: 14,
                            color: Colors.grey,
                            fontFamily: 'Regular',
                          ),
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
          ],
        ),
      ),
    );
  }
}
