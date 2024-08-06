import 'package:flutter/material.dart';
import 'package:todo/widgets/text_field.dart';

class MainDesktop extends StatelessWidget {
  final List<dynamic> listDDatas;
  final TextEditingController activityController;
  final TextEditingController fromController;
  final TextEditingController toController;
  final VoidCallback onTap;
  const MainDesktop(
      {super.key,
      required this.listDDatas,
      required this.onTap, required this.activityController, required this.fromController, required this.toController});

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
              topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
          color: Colors.white),
      child: Row(
        children: [
          // * Text Field Area
          Expanded(
            flex: 2,
            child: Container(
              height: screenHeight - 60,
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth / 30, vertical: 30.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                  ),
                  color: Color.fromARGB(255, 238, 242, 244)),
              child: MyTextField(onTap: onTap, activityController: activityController, fromController: fromController, toController: toController, controller: null,),
            ),
          ),

          //* Todo List Area
          Expanded(
            flex: 3,
            child: Container(
              height: screenHeight - 60,
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(20.0)),
                  color: Color.fromARGB(255, 203, 230, 243)),
              child: listDDatas.isNotEmpty
                  ? ListView.builder(
                      itemCount: listDDatas.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Icon(
                            Icons.select_all,
                            size: 19,
                          ),
                          title: Text(
                            listDDatas[index]['activity'],
                            style: TextStyle(fontSize: 14.0),
                          ),
                          subtitle: Text(
                            'From ${listDDatas[index]['from']} to ${listDDatas[index]['to']}',
                            style:
                                TextStyle(fontSize: 11, color: Colors.black38),
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
                                color: Color.fromARGB(255, 12, 112, 158)
                                    .withOpacity(0.5),
                                fontSize: 22.0),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.arrow_back,
                                color: Colors.black38,
                                size: 20.0,
                              ),
                              SizedBox(
                                width: 15.0,
                              ),
                              Text(
                                'you can add your todo now.',
                                style: TextStyle(
                                    color: Colors.black38,
                                    fontStyle: FontStyle.italic),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
            ),
          )
        ],
      ),
    );
  }
}
