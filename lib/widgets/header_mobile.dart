import 'package:flutter/material.dart';
import 'package:todo/widgets/text_field.dart';

class HeaderMobile extends StatelessWidget {
  final TextEditingController activityController;
  final bool isSending;
  final VoidCallback onTap;
  const HeaderMobile(
      {super.key,
      required this.onTap,
      required this.activityController,
      required this.isSending});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    return Container(
      width: screenWidth,
      padding: EdgeInsets.only(left: 20.0, right: 0.0, top: 14.0, bottom: 14.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                'TODO',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 19),
              ),
              Text(
                'APP',
                style: TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                    fontSize: 19),
              ),
              TextButton.icon(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          child: Container(
                            height: 162,
                            padding: EdgeInsets.all(15.0),
                            child: MyTextField(
                                onTap: onTap,
                                activityController: activityController,
                                isSending: isSending),
                          ),
                        );
                      });
                },
                label: Icon(
                  Icons.add,
                  size: 18.0,
                  color: Colors.white,
                ),
                style: TextButton.styleFrom(
                    shape: CircleBorder(),
                    backgroundColor: Color.fromARGB(255, 18, 113, 156)),
              )
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.person,
                size: 19,
              ),
              Row(
                children: [
                  Text(
                    'about',
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    'ME',
                    style: TextStyle(
                        color: Colors.black26, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 10,
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
