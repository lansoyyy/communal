import 'package:communal/screens/tabs/aboutus_tab.dart';
import 'package:communal/screens/tabs/communal_tab.dart';
import 'package:communal/screens/tabs/contactus_tab.dart';
import 'package:communal/screens/tabs/home_tab.dart';
import 'package:communal/screens/tabs/treepark_tab.dart';
import 'package:communal/widgets/text_widget.dart';
import 'package:communal/widgets/textfield_widget.dart';
import 'package:communal/widgets/toast_widget.dart';
import 'package:flutter/material.dart';

import 'adminhome_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final passController = TextEditingController();

  bool contact = false;
  bool about = false;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                opacity: 200,
                image: AssetImage(
                  'assets/images/back.jpg',
                ),
                fit: BoxFit.cover),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(50, 20, 50, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      contact = false;
                      about = false;
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                        height: 50,
                        width: 50,
                      ),
                      const Expanded(child: SizedBox()),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            contact = false;
                            about = false;
                          });
                        },
                        child: const SizedBox(
                          width: 600,
                          child: TabBar(
                            labelStyle: TextStyle(
                                color: Colors.black, fontFamily: 'Bold'),
                            labelColor: Colors.black,
                            unselectedLabelColor: Colors.grey,
                            tabs: [
                              Tab(
                                text: 'HOME',
                              ),
                              Tab(
                                text: 'COMMUNAL',
                              ),
                              Tab(
                                text: 'TREE PARK',
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: TextWidget(
                                  text: 'Enter Admin Password',
                                  fontSize: 18,
                                  fontFamily: 'Bold',
                                ),
                                content: SizedBox(
                                  height: 100,
                                  child: TextFieldWidget(
                                      label: 'Password',
                                      showEye: true,
                                      isObscure: true,
                                      controller: passController),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      if (passController.text !=
                                          'password123') {
                                        Navigator.pop(context);
                                        showToast('Incorrect admin password!');
                                      } else {
                                        Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const AdminHomeScreen()));
                                      }
                                    },
                                    child: TextWidget(
                                      text: 'Continue',
                                      fontSize: 18,
                                      fontFamily: 'Bold',
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        icon: const Icon(
                          Icons.admin_panel_settings,
                        ),
                      ),
                    ],
                  ),
                ),
                contact
                    ? ContactUs()
                    : about
                        ? const AboutUsTab()
                        : const Expanded(
                            child: TabBarView(children: [
                              HomeTab(),
                              CommunalTab(),
                              TreeparkTab(),
                            ]),
                          ),
                const SizedBox(
                  height: 50,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: SizedBox(
                    width: 600,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        contact == true || about == true
                            ? TextButton(
                                onPressed: () {
                                  setState(() {
                                    contact = false;
                                    about = false;
                                  });
                                },
                                child: TextWidget(
                                  text: 'HOME',
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontFamily: 'Bold',
                                ),
                              )
                            : const SizedBox(),
                        const SizedBox(
                          width: 10,
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              contact = true;
                              about = false;
                            });
                          },
                          child: TextWidget(
                            text: 'CONTACT US',
                            fontSize: 18,
                            color: contact ? Colors.grey : Colors.black,
                            fontFamily: 'Bold',
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              contact = false;
                              about = true;
                            });
                          },
                          child: TextWidget(
                            text: 'ABOUT US',
                            fontSize: 18,
                            color: about ? Colors.grey : Colors.black,
                            fontFamily: 'Bold',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
