import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/constants/device.dart';
import 'package:todo/widgets/header_desktop.dart';
import 'package:todo/widgets/header_mobile.dart';
import 'package:todo/widgets/main_desktop.dart';
import 'package:todo/widgets/main_mobile.dart';
import 'package:todo/widgets/text_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //* -----------------------------------------------------------------------------
  List<String> todoLists = [];
  bool isSending = false;
  final TextEditingController activityController = TextEditingController();

  void addTodo() async {
    if (activityController.text.trim().isNotEmpty) {
      setState(() {
        todoLists.add(activityController.text.trim());
      });
      // Obtain shared preferences.
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setStringList('todos', todoLists);

      activityController.clear();
    }
  }

  void addMTodo() async {
    if (activityController.text.trim().isNotEmpty) {
      setState(() {
        todoLists.add(activityController.text.trim());
      });
      // Obtain shared preferences.
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setStringList('todos', todoLists);

      // ignore: use_build_context_synchronously
      Navigator.pop(context);
      activityController.clear();
    } else {
      Navigator.pop(context);
    }
  }

  getTodos() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? todos = prefs.getStringList('todos');
    setState(() {
      todoLists = todos ?? [];
    });
  }

  @override
  void initState() {
    getTodos();
    super.initState();
  }

  //* -----------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: Container(
          height: screenHeight,
          width: screenWidth,
          color: Color.fromARGB(255, 24, 122, 167),
          child: Column(
            children: [
              // header section
              constraints.maxWidth >= kDeviceWidth
                  ? HeaderDesktop()
                  : HeaderMobile(
                      onTap: addMTodo,
                      activityController: activityController,
                      isSending: isSending,
                    ),

              // main section
              constraints.maxWidth >= kDeviceWidth
                  ? MainDesktop(
                      listDDatas: todoLists,
                      onTap: addTodo,
                      activityController: activityController,
                      isSending: isSending,
                    )
                  : MainMobile(
                      listMDatas: todoLists,
                    ),
            ],
          ),
        ),
        floatingActionButton: constraints.maxWidth <= kDeviceWidth
            ? OutlinedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          child: Container(
                            height: 162,
                            padding: EdgeInsets.all(15.0),
                            child: MyTextField(
                                onTap: addMTodo,
                                activityController: activityController,
                                isSending: isSending),
                          ),
                        );
                      });
                },
                style: OutlinedButton.styleFrom(
                    shape: CircleBorder(),
                    side: BorderSide(color: Colors.transparent),
                    backgroundColor: const Color.fromARGB(255, 19, 127, 177)),
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 18.0,
                ),
              )
            : null,
      );
    });
  }
}
