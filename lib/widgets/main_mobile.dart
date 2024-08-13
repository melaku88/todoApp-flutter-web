import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainMobile extends StatefulWidget {
  final List<String> listMDatas;
  const MainMobile({super.key, required this.listMDatas});

  @override
  State<MainMobile> createState() => _MainMobileState();
}

class _MainMobileState extends State<MainMobile> {
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
          color: Color.fromARGB(255, 238, 242, 244)),
      child: widget.listMDatas.isNotEmpty
          ? ListView.builder(
              itemCount: widget.listMDatas.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(
                    Icons.select_all,
                    size: 19,
                  ),
                  title: Text(widget.listMDatas[index]),
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
                                      'Do you want to delete "${widget.listMDatas[index]}"?'),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextButton(
                                          onPressed: () async {
                                            setState(() {
                                              // ignore: collection_methods_unrelated_type
                                              widget.listMDatas.remove(
                                                  widget.listMDatas[index]);
                                            });
                                            // Obtain shared preferences.
                                            final SharedPreferences prefs =
                                                await SharedPreferences
                                                    .getInstance();
                                            await prefs.setStringList(
                                                'todos', widget.listMDatas);

                                                // ignore: use_build_context_synchronously
                                                Navigator.pop(context);
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
