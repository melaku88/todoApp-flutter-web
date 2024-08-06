import 'package:flutter/material.dart';

class MainMobile extends StatelessWidget {
  final List<String> listMDatas;
  const MainMobile({super.key, required this.listMDatas});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    return Container(
      width: screenWidth,
      height: screenHeight - 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(17.0), topRight: Radius.circular(17.0)),
          color: Color.fromARGB(255, 237, 239, 241)),
      child: ListView.builder(
          itemCount: listMDatas.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Icon(
                Icons.select_all,
                size: 19,
              ),
              title: Text(
                listMDatas[index],
                style: TextStyle(fontSize: 14.0),
              ),
              trailing: Icon(
                Icons.delete_outline,
                size: 18.0,
              ),
            );
          }
        ),
    );
  }
}
