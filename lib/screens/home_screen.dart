import 'package:communal/screens/tabs/communal_tab.dart';
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

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: SizedBox(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(50, 20, 50, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/logo.jpeg',
                      height: 50,
                      width: 50,
                    ),
                    const Expanded(child: SizedBox()),
                    const SizedBox(
                      width: 600,
                      child: TabBar(
                        labelStyle:
                            TextStyle(color: Colors.black, fontFamily: 'Bold'),
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.grey,
                        tabs: [
                          Tab(
                            text: 'HOME',
                          ),
                          Tab(
                            text: 'COMMUNAL RANCH',
                          ),
                          Tab(
                            text: 'TREE PARK',
                          ),
                        ],
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
                                    if (passController.text != 'password123') {
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
                const Expanded(
                  child: TabBarView(children: [
                    HomeTab(),
                    CommunalTab(),
                    TreeparkTab(),
                  ]),
                ),
                SizedBox(
                  height: 100,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.facebook),
                            label: TextWidget(
                              text: 'sample@facebook.com',
                              fontSize: 18,
                            ),
                          ),
                          TextButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.g_mobiledata),
                            label: TextWidget(
                              text: 'sample@google.com',
                              fontSize: 18,
                            ),
                          ),
                          TextButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.phone),
                            label: TextWidget(
                              text: '09090104355',
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 50, right: 50),
                        child: TextWidget(
                          text:
                              'Pariatur Lorem consequat veniam id Lorem ea ea. Sunt exercitation nostrud cillum ad enim ea elit. Aliquip irure irure pariatur laborum labore pariatur et laborum. Consequat minim ea excepteur consectetur cupidatat est duis amet est adipisicing minim ea ut id. Amet consectetur labore nulla quis duis officia est ad. Qui fugiat amet cillum ex tempor labore laborum aliquip nulla. Amet do in velit laboris et laboris sint.',
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
