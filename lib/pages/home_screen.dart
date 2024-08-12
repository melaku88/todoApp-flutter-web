import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo/api/api.dart';
import 'package:todo/constants/device.dart';
import 'package:todo/utilis/snackbar.dart';
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
  final user = APIs.auth.currentUser;
  final TextEditingController activityController = TextEditingController();

  void addTodo() async {
    setState(() {
      isSending = true;
    });
    try {
      if (activityController.text.trim().isNotEmpty) {
        await FirebaseFirestore.instance
            .collection('Todos')
            .doc(user!.uid)
            .collection(DateFormat('dd MMMM yyyy').format(DateTime.now()))
            .add({'activity': activityController.text.trim()});
        setState(() {
          isSending = false;
        });
        // Navigator.pop(context);
        activityController.clear();
      } else {
        setState(() {
          isSending = false;
        });
        Snackbars.snackBarError(context, 'Please wire a todo activity');
      }
    } on FirebaseException catch (e) {
      setState(() {
        isSending = false;
      });
      Snackbars.snackBarError(context, e.code);
    }
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
                      onTap: addTodo,
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
            ? FloatingActionButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          height: 285,
                          padding: EdgeInsets.only(
                              top: 20.0,
                              left: 15.0,
                              right: 15.0,
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: MyTextField(
                            onTap: addTodo,
                            activityController: activityController,
                            isSending: isSending,
                          ),
                        );
                      });
                },
                shape: CircleBorder(),
                backgroundColor: Color.fromARGB(255, 18, 116, 162),
                child: Icon(Icons.add, color: Colors.white),
              )
            : null,
      );
    });
  }
}
