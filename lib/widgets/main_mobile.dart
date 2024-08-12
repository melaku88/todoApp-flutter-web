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
          color: Color.fromARGB(255, 203, 230, 243)),
      child: listMDatas.isNotEmpty
          ? ListView.builder(
              itemCount: listMDatas.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(
                    Icons.select_all,
                    size: 19,
                  ),
                  trailing: Icon(
                    Icons.delete_outline,
                    size: 18.0,
                  ),
                );
              })
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '!No todo added',
                    style: TextStyle(
                        color:
                            Color.fromARGB(255, 12, 112, 158).withOpacity(0.5),
                        fontSize: 22.0),
                  ),
                  Text(
                    'Press plus sign & add your todo now.',
                    style: TextStyle(
                        color: Colors.black38, fontStyle: FontStyle.italic),
                  )
                ],
              ),
            ),
    );
  }
}
