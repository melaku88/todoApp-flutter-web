import 'package:flutter/material.dart';
import 'package:todo/api/api.dart';

class HeaderDesktop extends StatelessWidget {
  const HeaderDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    return Container(
      width: screenWidth,
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 14.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                'TODO',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              Text(
                'APP',
                style:
                    TextStyle(color: Colors.amber, fontWeight: FontWeight.bold),
              ),
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
                ],
              ),
              TextButton.icon(
                onPressed: () {
                  APIs.logout(context);
                },
                label: Icon(
                  Icons.logout,
                  size: 18.0,
                  color: Colors.white,
                ),
                style: TextButton.styleFrom(
                    shape: CircleBorder(),
                    backgroundColor: Color.fromARGB(255, 18, 113, 156)),
              )
            ],
          )
        ],
      ),
    );
  }
}
