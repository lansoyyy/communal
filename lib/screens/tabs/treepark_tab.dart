import 'package:communal/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class TreeparkTab extends StatelessWidget {
  const TreeparkTab({super.key});

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
          child: ListView.separated(
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
                          text: 'Title of the Activity',
                          fontSize: 24,
                          fontFamily: 'Bold',
                          color: Colors.black,
                        ),
                        TextWidget(
                          text: 'Description of the Activity',
                          fontSize: 14,
                          fontFamily: 'Regular',
                          color: Colors.grey,
                        ),
                        TextWidget(
                          text: 'Date and Time of the Activity',
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
              itemCount: 50),
        ),
      ),
    );
  }
}
