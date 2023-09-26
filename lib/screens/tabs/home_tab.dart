import 'package:communal/services/add_booking.dart';
import 'package:communal/widgets/textfield_widget.dart';
import 'package:communal/widgets/toast_widget.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../widgets/button_widget.dart';
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
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 500,
              height: 400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 150,
                    width: 300,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 300,
                    child: TextWidget(
                      text:
                          '"Welcome to Communical Ranch in Impasugong, Bukidnon! Experience nature and culture like never before. Start your adventure now!"',
                      fontSize: 14,
                      fontFamily: 'Regular',
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ButtonWidget(
                    radius: 100,
                    color: primary,
                    label: 'Book Now',
                    onPressed: () {
                      bookDialog(context);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  final nameController = TextEditingController();

  final emailController = TextEditingController();

  final numberController = TextEditingController();

  final addressController = TextEditingController();

  int persons = 0;

  bookDialog(context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: TextWidget(
            text: 'Add Booking',
            fontSize: 18,
            fontFamily: 'Bold',
          ),
          content: StatefulBuilder(builder: (context, setState) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFieldWidget(
                  label: 'Name',
                  controller: nameController,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFieldWidget(
                  label: 'Contact Number',
                  controller: numberController,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFieldWidget(
                  label: 'Email',
                  controller: emailController,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFieldWidget(
                  label: 'Address',
                  controller: addressController,
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: 'Number of Persons',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Bold',
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: '*',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Bold',
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 60,
                      width: 325,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              persons.toString(),
                              style: const TextStyle(
                                fontFamily: 'Regular',
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                            const Expanded(child: SizedBox()),
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      persons++;
                                    });
                                  },
                                  child: SizedBox(
                                    height: 22,
                                    child: Icon(
                                      Icons.arrow_drop_up,
                                      color: primary,
                                      size: 38,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    if (persons > 0) {
                                      setState(() {
                                        persons--;
                                      });
                                    }
                                  },
                                  child: SizedBox(
                                    height: 22,
                                    child: Icon(
                                      Icons.arrow_drop_down,
                                      color: primary,
                                      size: 38,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          }),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: TextWidget(
                text: 'Close',
                fontSize: 14,
                fontFamily: 'Medium',
              ),
            ),
            TextButton(
              onPressed: () {
                addBooking(nameController.text, numberController.text,
                    emailController.text, addressController.text, persons);
                showToast('Added booking! Wait for admins response');
                Navigator.pop(context);
              },
              child: TextWidget(
                text: 'Add Booking',
                fontSize: 14,
                fontFamily: 'Medium',
              ),
            ),
          ],
        );
      },
    );
  }
}
