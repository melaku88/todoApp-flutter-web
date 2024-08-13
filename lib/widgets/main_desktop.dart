import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/widgets/text_field.dart';

class MainDesktop extends StatefulWidget {
  final List<String> listDDatas;
  final TextEditingController activityController;
  final bool isSending;
  final VoidCallback onTap;
  const MainDesktop(
      {super.key,
      required this.listDDatas,
      required this.onTap,
      required this.activityController,
      required this.isSending});

  @override
  State<MainDesktop> createState() => _MainDesktopState();
}

class _MainDesktopState extends State<MainDesktop> {
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
              child: MyTextField(
                onTap: widget.onTap,
                activityController: widget.activityController,
                isSending: widget.isSending,
              ),
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
              child: widget.listDDatas.isNotEmpty
                  ? ListView.builder(
                      itemCount: widget.listDDatas.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Icon(
                            Icons.select_all,
                            size: 19,
                          ),
                          title: Text(widget.listDDatas[index]),
                          trailing: InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return Container(
                                      height: 105,
                                      padding: EdgeInsets.all(20.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                              'Do you want to delete "${widget.listDDatas[index]}"?'),
                                              SizedBox(height: 10.0,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              TextButton(
                                                  onPressed: () async {
                                                    setState(() {
                                                      // ignore: collection_methods_unrelated_type
                                                      widget.listDDatas
                                                          .remove(widget.listDDatas[index]);
                                                    });
                                                    // Obtain shared preferences.
                                                    final SharedPreferences
                                                        prefs =
                                                        await SharedPreferences
                                                            .getInstance();
                                                    await prefs.setStringList(
                                                        'todos',
                                                        widget.listDDatas);
                                                  },
                                                  child: Text('delete')),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text('Cancel')),
                                            ],
                                          )
                                        ],
                                      ),
                                    );
                                  });
                            },
                            child: Icon(
                              Icons.delete_outline,
                              size: 18.0,
                            ),
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
