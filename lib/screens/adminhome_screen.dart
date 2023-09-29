import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:communal/utils/colors.dart';
import 'package:communal/widgets/button_widget.dart';
import 'package:communal/widgets/text_widget.dart';
import 'package:communal/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  GoogleMapController? mapController;

  final latController = TextEditingController();
  final longController = TextEditingController();

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  late double lat;
  late double long;
  Set<Polygon> polygon = HashSet<Polygon>();
  @override
  Widget build(BuildContext context) {
    CameraPosition initialCameraPosition = const CameraPosition(
      target: LatLng(8.308780, 124.985769),
      zoom: 14,
    );
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 150,
                  decoration: const BoxDecoration(
                    color: Colors.green,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, top: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          text: 'Admin Dashboard',
                          fontSize: 28,
                          fontFamily: 'Bold',
                          color: Colors.white,
                        ),
                        const Expanded(child: SizedBox()),
                        TextButton.icon(
                          onPressed: () {
                            addCommunal(true);
                          },
                          icon: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          label: TextWidget(
                            text: 'Add Communal Activity',
                            fontFamily: 'Bold',
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                        TextButton.icon(
                          onPressed: () {
                            addCommunal(false);
                          },
                          icon: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          label: TextWidget(
                            text: 'Add Communal Activity',
                            fontFamily: 'Bold',
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 75),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      for (int i = 0; i < 4; i++)
                        i == 3
                            ? StreamBuilder<QuerySnapshot>(
                                stream: FirebaseFirestore.instance
                                    .collection('Reports')
                                    .snapshots(),
                                builder: (BuildContext context,
                                    AsyncSnapshot<QuerySnapshot> snapshot) {
                                  if (snapshot.hasError) {
                                    print('error');
                                    return const Center(child: Text('Error'));
                                  }
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const Padding(
                                      padding: EdgeInsets.only(top: 50),
                                      child: Center(
                                          child: CircularProgressIndicator(
                                        color: Colors.black,
                                      )),
                                    );
                                  }

                                  final data = snapshot.requireData;
                                  return GestureDetector(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return StatefulBuilder(
                                              builder: (context, setState) {
                                            return Dialog(
                                              child: SizedBox(
                                                width: 600,
                                                height: 600,
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          Alignment.topRight,
                                                      child: IconButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        icon: const Icon(
                                                          Icons.close,
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: ListView.builder(
                                                        itemCount:
                                                            data.docs.length,
                                                        itemBuilder:
                                                            (context, index) {
                                                          return ListTile(
                                                            title: TextWidget(
                                                              text: data.docs[
                                                                  index]['msg'],
                                                              fontSize: 18,
                                                              fontFamily:
                                                                  'Bold',
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                            subtitle:
                                                                TextWidget(
                                                              text: data.docs[
                                                                  index]['msg'],
                                                              fontSize: 14,
                                                              fontFamily:
                                                                  'Medium',
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                            trailing:
                                                                IconButton(
                                                              onPressed:
                                                                  () async {
                                                                await FirebaseFirestore
                                                                    .instance
                                                                    .collection(
                                                                        'Reports')
                                                                    .doc(data
                                                                        .docs[
                                                                            index]
                                                                        .id)
                                                                    .delete();
                                                              },
                                                              icon: const Icon(
                                                                Icons.delete,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          });
                                        },
                                      );
                                    },
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      elevation: 3,
                                      child: Container(
                                        width: 250,
                                        height: 150,
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  TextWidget(
                                                    text: 'Reports',
                                                    fontSize: 18,
                                                    fontFamily: 'Medium',
                                                    color: Colors.grey,
                                                  ),
                                                  const Icon(
                                                    Icons.pending,
                                                    color: Colors.grey,
                                                    size: 32,
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              TextWidget(
                                                text:
                                                    data.docs.length.toString(),
                                                fontSize: 28,
                                                fontFamily: 'Bold',
                                                color: Colors.black,
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              TextWidget(
                                                text: 'List of Reports',
                                                fontSize: 14,
                                                fontFamily: 'Regular',
                                                color: Colors.grey,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                })
                            : StreamBuilder<QuerySnapshot>(
                                stream: FirebaseFirestore.instance
                                    .collection('Bookings')
                                    .where('status',
                                        isEqualTo: i == 0
                                            ? 'Pending'
                                            : i == 1
                                                ? 'Rejected'
                                                : 'Accepted')
                                    .snapshots(),
                                builder: (BuildContext context,
                                    AsyncSnapshot<QuerySnapshot> snapshot) {
                                  if (snapshot.hasError) {
                                    print('error');
                                    return const Center(child: Text('Error'));
                                  }
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const Padding(
                                      padding: EdgeInsets.only(top: 50),
                                      child: Center(
                                          child: CircularProgressIndicator(
                                        color: Colors.black,
                                      )),
                                    );
                                  }

                                  final data = snapshot.requireData;
                                  return GestureDetector(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return StatefulBuilder(
                                              builder: (context, setState) {
                                            return Dialog(
                                              child: SizedBox(
                                                width: 600,
                                                height: 600,
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          Alignment.topRight,
                                                      child: IconButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        icon: const Icon(
                                                          Icons.close,
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: ListView.builder(
                                                        itemCount:
                                                            data.docs.length,
                                                        itemBuilder:
                                                            (context, index) {
                                                          return ListTile(
                                                            title: TextWidget(
                                                              text: data.docs[
                                                                          index]
                                                                      ['name'] +
                                                                  ' - ' +
                                                                  data.docs[
                                                                          index]
                                                                          [
                                                                          'nums']
                                                                      .toString(),
                                                              fontSize: 18,
                                                              fontFamily:
                                                                  'Bold',
                                                            ),
                                                            subtitle:
                                                                TextWidget(
                                                              text: data.docs[
                                                                      index]
                                                                  ['number'],
                                                              fontSize: 14,
                                                              fontFamily:
                                                                  'Medium',
                                                            ),
                                                            trailing: i == 0
                                                                ? SizedBox(
                                                                    width: 100,
                                                                    child: Row(
                                                                      children: [
                                                                        IconButton(
                                                                          onPressed:
                                                                              () async {
                                                                            await FirebaseFirestore.instance.collection('Bookings').doc(data.docs[index].id).update({
                                                                              'status': 'Accepted'
                                                                            });
                                                                          },
                                                                          icon:
                                                                              const Icon(
                                                                            Icons.check_box,
                                                                          ),
                                                                        ),
                                                                        IconButton(
                                                                          onPressed:
                                                                              () async {
                                                                            await FirebaseFirestore.instance.collection('Bookings').doc(data.docs[index].id).update({
                                                                              'status': 'Rejected'
                                                                            });
                                                                          },
                                                                          icon:
                                                                              const Icon(
                                                                            Icons.close,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  )
                                                                : IconButton(
                                                                    onPressed:
                                                                        () async {
                                                                      await FirebaseFirestore
                                                                          .instance
                                                                          .collection(
                                                                              'Bookings')
                                                                          .doc(data
                                                                              .docs[index]
                                                                              .id)
                                                                          .delete();
                                                                    },
                                                                    icon:
                                                                        const Icon(
                                                                      Icons
                                                                          .delete,
                                                                    ),
                                                                  ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          });
                                        },
                                      );
                                    },
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      elevation: 3,
                                      child: Container(
                                        width: 250,
                                        height: 150,
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  TextWidget(
                                                    text: i == 0
                                                        ? 'Pending'
                                                        : i == 1
                                                            ? 'Rejected'
                                                            : 'Accepted',
                                                    fontSize: 18,
                                                    fontFamily: 'Medium',
                                                    color: Colors.grey,
                                                  ),
                                                  const Icon(
                                                    Icons.pending,
                                                    color: Colors.grey,
                                                    size: 32,
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              TextWidget(
                                                text:
                                                    data.docs.length.toString(),
                                                fontSize: 28,
                                                fontFamily: 'Bold',
                                                color: Colors.black,
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              TextWidget(
                                                text:
                                                    'Tourist who are ${i == 0 ? 'Pending' : i == 1 ? 'Rejected' : 'Accepted'}',
                                                fontSize: 14,
                                                fontFamily: 'Regular',
                                                color: Colors.grey,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Stack(
              children: [
                SizedBox(
                  height: 375,
                  width: double.infinity,
                  child: GoogleMap(
                    zoomControlsEnabled: false,
                    mapType: MapType.hybrid,
                    polygons: polygon,
                    onMapCreated: _onMapCreated,
                    initialCameraPosition: initialCameraPosition,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            bottom: 20, right: 30, top: 20),
                        child: Container(
                          width: 300,
                          height: 250,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TextFieldWidget(
                                  controller: latController,
                                  label: 'Enter latitude',
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFieldWidget(
                                  controller: longController,
                                  label: 'Enter longitude',
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                ButtonWidget(
                                  color: primary,
                                  fontSize: 14,
                                  height: 40,
                                  width: 150,
                                  label: 'Submit',
                                  onPressed: () {
                                    mapController!.animateCamera(
                                      CameraUpdate.newCameraPosition(
                                        CameraPosition(
                                          target: LatLng(
                                              double.parse(latController.text),
                                              double.parse(
                                                  longController.text)),
                                          zoom: 14,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
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

  final nameController = TextEditingController();

  final descController = TextEditingController();

  addCommunal(bool inCommunal) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: TextWidget(
            text: 'Add Activity',
            fontSize: 18,
            fontFamily: 'Bold',
          ),
          content: StatefulBuilder(builder: (context, setState) {
            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: double.infinity,
                    color: Colors.black,
                    height: 150,
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFieldWidget(
                    label: 'Name of the Activity',
                    controller: nameController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFieldWidget(
                    label: 'Description of the Activity',
                    controller: descController,
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
                          timePicker();
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
                ],
              ),
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
                // addBooking(
                //     nameController.text,
                //     numberController.text,
                //     emailController.text,
                //     addressController.text,
                //     persons,
                //     dateController.text,
                //     timeController.text);
                // showToast('Added booking! Wait for admins response');
                Navigator.pop(context);
              },
              child: TextWidget(
                text: 'Submit',
                fontSize: 14,
                fontFamily: 'Medium',
              ),
            ),
          ],
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

  void timePicker() async {
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

  final dateController = TextEditingController();
  final timeController = TextEditingController();
}
