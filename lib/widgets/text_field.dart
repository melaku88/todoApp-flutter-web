import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController activityController;
  final TextEditingController fromController;
  final TextEditingController toController;
  final VoidCallback onTap;
  const MyTextField({super.key, required this.onTap, required this.activityController, required this.fromController, required this.toController, required controller});

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
          controller: activityController,
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

        TextField(
          controller: fromController,
          cursorWidth: 1,
          keyboardType: TextInputType.datetime,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 10.0),
            label: Text(
              'From (clock)',
              style: TextStyle(fontSize: 13.0, color: Colors.blueGrey.shade300),
            ),
          ),
        ),

        SizedBox(height: 10.0,),

        TextField(
          controller: toController,
          cursorWidth: 1,
          keyboardType: TextInputType.datetime,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 10.0),
            label: Text(
              'To (clock)',
              style: TextStyle(fontSize: 13.0, color: Colors.blueGrey.shade300),
            ),
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        OutlinedButton(
            onPressed: onTap,
            style: OutlinedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 19, 160, 225)),
            child: const Text(
              'add todo',
              style: TextStyle(color: Colors.white),
            ))
      ],
    );
  }
}
