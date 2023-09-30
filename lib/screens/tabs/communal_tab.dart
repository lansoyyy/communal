import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:communal/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class CommunalTab extends StatelessWidget {
  const CommunalTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 600,
        width: 800,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
          child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('Activities')
                  .where('type', isEqualTo: 'Communal')
                  .orderBy('dateTime', descending: true)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  print(snapshot.error);
                  print('error');
                  return const Center(child: Text('Error'));
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: Center(
                        child: CircularProgressIndicator(
                      color: Colors.black,
                    )),
                  );
                }

                final data = snapshot.requireData;
                return ListView.separated(
                    itemBuilder: (context, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 150,
                            width: 200,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(
                                  data.docs[index]['img'],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget(
                                text: data.docs[index]['name'],
                                fontSize: 24,
                                fontFamily: 'Bold',
                                color: Colors.black,
                              ),
                              TextWidget(
                                text: data.docs[index]['desc'],
                                fontSize: 14,
                                fontFamily: 'Regular',
                                color: Colors.grey,
                              ),
                              TextWidget(
                                text:
                                    'on ${data.docs[index]['date']} at ${data.docs[index]['time']}',
                                fontSize: 12,
                                fontFamily: 'Regular',
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider();
                    },
                    itemCount: data.docs.length);
              }),
        ),
      ),
    );
  }
}
