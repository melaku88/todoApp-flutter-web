import 'package:flutter/material.dart';

class MainDesktop extends StatelessWidget {
  final List<String> listDDatas;
  final TextEditingController controller;
  const MainDesktop(
      {super.key, required this.listDDatas, required this.controller});

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
          Expanded(
            flex: 2,
            child: Container(
              height: screenHeight - 60,
              padding: EdgeInsets.symmetric(horizontal: screenWidth/30, vertical: 30.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                  ),
                  color: Color.fromARGB(255, 238, 242, 244)),
              child: Column(
                children: [
                  const Text('Add Your Task Here', style: TextStyle(
                    color: Colors.black38,
                    fontSize: 16,
                    fontWeight: FontWeight.w600
                  ),),
                  const SizedBox(
                    height: 45.0,
                  ),
                  TextField(
                    controller: controller,
                    autofocus: true,
                    cursorWidth: 1,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 10.0),
                      label: Text(
                        'Write todo',
                        style: TextStyle(
                            fontSize: 13.0, color: Colors.blueGrey.shade300),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 19, 160, 225)),
                      child: const Text(
                        'add todo',
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              ),
            ),
          ),
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
                            listDDatas[index],
                            style: TextStyle(fontSize: 14.0),
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
