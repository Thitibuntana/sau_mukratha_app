import 'dart:io';
import 'package:flutter/material.dart';
import "package:image_picker/image_picker.dart";
import "package:flutter/services.dart";

class CalBillUI extends StatefulWidget {
  const CalBillUI({super.key});

  @override
  State<CalBillUI> createState() => _CalBillUIState();
}

class _CalBillUIState extends State<CalBillUI> {
  bool adultCheck = false;
  bool childCheck = false;

  TextEditingController adultCtrl = TextEditingController(text: '0');
  TextEditingController childCtrl = TextEditingController(text: '0');

  File? imgFile;
  Future<void> openCamera() async {
    final picker = await ImagePicker().pickImage(
      source: ImageSource.camera,
      imageQuality: 75,
    );
    if (picker == null) return;

    setState(() {
      imgFile = File(picker.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: 35.0,
            right: 35.0,
          ),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                InkWell(
                  onTap: () {
                    openCamera();
                  },
                  child: imgFile == null
                      ? Image.asset(
                          'assets/images/camera.jpg',
                          height: 120.0,
                        )
                      : Image.file(
                          imgFile!,
                          height: 120.0,
                        ),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.05,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Amount of people',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.01,
                ),
                Row(
                  children: [
                    Checkbox(
                      onChanged: (v) {
                        setState(() {
                          adultCheck = v!;
                          if (v! == false) {
                            adultCtrl.text = '0';
                          }
                        });
                      },
                      value: adultCheck,
                    ),
                    SizedBox(
                      width: 165,
                      child: Text(
                        'Adult - 299฿ / person: ',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Flexible(
                      child: TextField(
                        controller: adultCtrl,
                        enabled: adultCheck,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(
                          suffix: Text(
                            ' People',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.01,
                ),
                Row(
                  children: [
                    Checkbox(
                      onChanged: (v) {
                        setState(() {
                          childCheck = v!;
                          if (v! == false) {
                            childCtrl.text = '0';
                          }
                        });
                      },
                      value: childCheck,
                    ),
                    SizedBox(
                      width: 165,
                      child: Text(
                        'Child - 69฿ / person: ',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Flexible(
                      child: TextField(
                        controller: childCtrl,
                        enabled: childCheck,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(
                          suffix: Text(
                            ' People',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.015,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Buffet Drinks',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                 SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.025,
                ),
                Row(
                  children: [
                    Radio(
                      onChanged: (v) {},
                      value: 1,
                      groupValue: null,
                    ),
                    Text(
                      '25฿ / Person'
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
