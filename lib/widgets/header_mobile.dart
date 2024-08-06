import 'package:flutter/material.dart';

class HeaderMobile extends StatelessWidget {
  const HeaderMobile({super.key});

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
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
              ),
              Text(
                'APP',
                style:
                    TextStyle(color: Colors.amber, fontWeight: FontWeight.bold, fontSize: 13),
              ),

              TextButton.icon(
                onPressed: (){}, 
                label: Icon(Icons.add, size: 18.0, color: Colors.white,),
                style: TextButton.styleFrom(
                  shape: CircleBorder(),
                  backgroundColor: Color.fromARGB(255, 18, 113, 156)
                ),
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
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
