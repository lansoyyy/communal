import 'package:communal/utils/colors.dart';
import 'package:communal/widgets/button_widget.dart';
import 'package:communal/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../services/add_booking.dart';
import '../../widgets/textfield_widget.dart';
import '../../widgets/toast_widget.dart';
import 'aboutus_tab.dart';
import 'contactus_tab.dart';

class TreeparkTab extends StatefulWidget {
  const TreeparkTab({super.key});

  @override
  State<TreeparkTab> createState() => _TreeparkTabState();
}

class _TreeparkTabState extends State<TreeparkTab> {
  final dateController = TextEditingController();
  final timeController = TextEditingController();
  bool gcashSelected = false;
  bool paymayaSelected = false;
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
                    onPressed: () {
                      bookDialog(context, 'GREEN HOUSE',
                          'GREEN HOUSE - 1000 PHP/night good for 4-6 person');
                    },
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
                    onPressed: () {
                      bookDialog(context, 'DUPLEX HOUSE',
                          'DUPLEX HOUSE - 1500 PHP/night good for 6-8 person');
                    },
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
                    onPressed: () {
                      bookDialog(context, 'DORM HOUSE',
                          'DORM HOUSE - 4000 PHP/night good for 15-20 person');
                    },
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
            text: '360 View',
            fontSize: 32,
            color: Colors.black,
            fontFamily: 'Bold',
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 1000,
            height: 500,
            child: Image.asset('assets/images/pano2.jpg'),
          ),
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

  final nameController = TextEditingController();

  final emailController = TextEditingController();

  final numberController = TextEditingController();

  final addressController = TextEditingController();

  final provinceController = TextEditingController();
  final munController = TextEditingController();
  final brgyController = TextEditingController();

  int persons = 0;

  bool check1 = false;

  bookDialog(context, String type, String desc) {
    setState(() {
      check1 = false;
    });
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
            return SingleChildScrollView(
              child: Column(
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
                    label: 'Province',
                    controller: provinceController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFieldWidget(
                    label: 'Municipality',
                    controller: munController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFieldWidget(
                    label: 'Baranggay',
                    controller: brgyController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: 'Date',
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
                      GestureDetector(
                        onTap: () {
                          dateFromPicker(context);
                        },
                        child: SizedBox(
                          width: 325,
                          height: 50,
                          child: TextFormField(
                            enabled: false,
                            style: const TextStyle(
                              fontFamily: 'Regular',
                              fontSize: 14,
                              color: Colors.black,
                            ),

                            decoration: InputDecoration(
                              suffixIcon: Icon(
                                Icons.calendar_month_outlined,
                                color: primary,
                              ),
                              hintStyle: const TextStyle(
                                fontFamily: 'Regular',
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                              hintText: dateController.text,
                              border: InputBorder.none,
                              disabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.red,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              errorStyle: const TextStyle(
                                  fontFamily: 'Bold', fontSize: 12),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.red,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),

                            controller: dateController,
                            // Pass the validator to the TextFormField
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: 'Time',
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
                      GestureDetector(
                        onTap: () {
                          timePicker(context);
                        },
                        child: SizedBox(
                          width: 325,
                          height: 50,
                          child: TextFormField(
                            enabled: false,
                            style: TextStyle(
                              fontFamily: 'Regular',
                              fontSize: 14,
                              color: primary,
                            ),

                            decoration: InputDecoration(
                              suffixIcon: Icon(
                                Icons.calendar_month_outlined,
                                color: primary,
                              ),
                              hintStyle: const TextStyle(
                                fontFamily: 'Regular',
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                              hintText: timeController.text,
                              border: InputBorder.none,
                              disabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.red,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              errorStyle: const TextStyle(
                                  fontFamily: 'Bold', fontSize: 12),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.red,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),

                            controller: timeController,
                            // Pass the validator to the TextFormField
                          ),
                        ),
                      ),
                    ],
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
                                  color: Colors.black,
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
                  Row(
                    children: [
                      Checkbox(
                        value: check1,
                        onChanged: (value) {
                          setState(() {
                            check1 = !check1;
                          });
                        },
                      ),
                      const SizedBox(
                        width: 300,
                        child: Text(
                          'I agree with terms and conditions',
                          style: TextStyle(fontFamily: 'Medium'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CheckboxListTile(
                        title: const Text('GCash'),
                        value: gcashSelected,
                        onChanged: (value) {
                          setState(() {
                            gcashSelected = value!;

                            if (value) {
                              paymayaSelected = false;
                            }
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: const Text('PayMaya'),
                        value: paymayaSelected,
                        onChanged: (value) {
                          setState(() {
                            paymayaSelected = value!;
                            if (value) {
                              gcashSelected = false;
                            }
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
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
                      Visibility(
                        visible: check1,
                        child: TextButton(
                          onPressed: () {
                            addBooking(
                                nameController.text,
                                numberController.text,
                                emailController.text,
                                addressController.text,
                                persons,
                                dateController.text,
                                timeController.text,
                                type,
                                desc,
                                gcashSelected ? 'GCash' : 'PayMaya',
                                provinceController.text,
                                munController.text,
                                brgyController.text);
                            showToast(
                                'Added booking! Wait for admins response');
                            Navigator.pop(context);
                          },
                          child: TextWidget(
                            text: 'Add Booking',
                            fontSize: 14,
                            fontFamily: 'Medium',
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
        );
      },
    );
  }

  void dateFromPicker(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: primary!,
                onPrimary: Colors.white,
                onSurface: Colors.grey,
              ),
            ),
            child: child!,
          );
        },
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2050));

    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);

      setState(() {
        dateController.text = formattedDate;
      });
    } else {
      return null;
    }
  }

  void timePicker(context) async {
    TimeOfDay? pickedTime = await showTimePicker(
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: primary!,
              onPrimary: Colors.white,
              onSurface: Colors.grey,
            ),
          ),
          child: child!,
        );
      },
      initialTime: TimeOfDay.now(),
      context: context,
    );

    if (pickedTime != null) {
      DateTime currentTime = DateTime.now();
      DateTime selectedTime = DateTime(
        currentTime.year,
        currentTime.month,
        currentTime.day,
        pickedTime.hour,
        pickedTime.minute,
      );

      String formattedTime = DateFormat('hh:mm a').format(selectedTime);

      setState(() {
        timeController.text = formattedTime;
      });
    }
  }
}
