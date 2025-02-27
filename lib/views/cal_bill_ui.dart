import 'package:flutter/material.dart';

class CalBillUI extends StatefulWidget {
  const CalBillUI({super.key});

  @override
  State<CalBillUI> createState() => _CalBillUIState();
}

class _CalBillUIState extends State<CalBillUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: 8.0,
            right: 8.0,
          ),
          child: Center(
            child: Column(children: [
              SizedBox(
                height: 50,
              ),
              Image.asset(
                'assets/images/camera.jpg',
                height: 120.0,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
