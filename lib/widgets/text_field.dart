import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  final TextEditingController activityController;
  final bool isSending;
  final VoidCallback onTap;
  const MyTextField({super.key, required this.onTap, required this.activityController, required this.isSending});

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Add Your Task Here',
          style: TextStyle(
              color: Colors.black38, fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 15.0,
        ),
        TextField(
          controller: widget.activityController,
          cursorWidth: 1,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 10.0),
            label: Text(
              'Activity',
              style: TextStyle(fontSize: 13.0, color: Colors.blueGrey.shade300),
            ),
          ),
        ),

        SizedBox(height: 10.0,),

        const SizedBox(
          height: 20.0,
        ),
        OutlinedButton(
            onPressed: widget.onTap,
            style: OutlinedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 19, 160, 225)),
            child: widget.isSending 
              ? Container(
                height: 20,
                width: 20,
                alignment: Alignment.center,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2.0,
                ),
              )
              : const Text(
              'add todo',
              style: TextStyle(color: Colors.white),
            ))
      ],
    );
  }
}
