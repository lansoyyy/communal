import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:communal/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  GoogleMapController? mapController;

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
                    child: TextWidget(
                      text: 'Admin Dashboard',
                      fontSize: 28,
                      fontFamily: 'Bold',
                      color: Colors.white,
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
                                                text: 'Tourist who are pending',
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
          ],
        ),
      ),
    );
  }
}
