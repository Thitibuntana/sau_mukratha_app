// ignore_for_file: sort_child_properties_last

import 'dart:io';
import 'package:flutter/material.dart';
import "package:image_picker/image_picker.dart";
import "package:flutter/services.dart";
import 'package:sau_mukratha_app/views/show_bill_ui.dart';

class CalBillUI extends StatefulWidget {
  const CalBillUI({super.key});

  @override
  State<CalBillUI> createState() => _CalBillUIState();
}

class _CalBillUIState extends State<CalBillUI> {
  bool adultCheck = false;
  bool childCheck = false;

  int drinksCheck = 2;

  List<String> memberType = ['None', 'Generic - 5%', 'VIP - 20%'];

  double discount = 0.0;
  double showDiscount = 0.0;

  TextEditingController adultCtrl = TextEditingController(text: '0');
  TextEditingController childCtrl = TextEditingController(text: '0');

  TextEditingController cokeCtrl = TextEditingController(text: '0');
  TextEditingController waterCtrl = TextEditingController(text: '0');

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
                          if (v == false) {
                            adultCtrl.text = '0';
                          }
                        });
                      },
                      value: adultCheck,
                    ),
                    SizedBox(
                      width: 165,
                      child: Text(
                        'Adult - 299฿ / Person: ',
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
                          if (v == false) {
                            childCtrl.text = '0';
                          }
                        });
                      },
                      value: childCheck,
                    ),
                    SizedBox(
                      width: 165,
                      child: Text(
                        'Child - 69฿ / Person: ',
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
                      onChanged: (v) {
                        setState(() {
                          drinksCheck = v!;
                          if (v == 1) {
                            cokeCtrl.text = '0';
                            waterCtrl.text = '0';
                          }
                        });
                      },
                      value: 1,
                      groupValue: drinksCheck,
                    ),
                    Text('25฿ / Person'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      onChanged: (v) {
                        setState(() {
                          drinksCheck = v!;
                        });
                      },
                      value: 2,
                      groupValue: drinksCheck,
                    ),
                    Text('No Refill'),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.005,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 48,
                    ),
                    SizedBox(
                      width: 165,
                      child: Text(
                        'Cola - 20฿ / Bottle: ',
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
                        controller: cokeCtrl,
                        enabled: drinksCheck == 1 ? false : true,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(
                          suffix: Text(
                            ' Bottles',
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
                  height: MediaQuery.sizeOf(context).height * 0.005,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 48,
                    ),
                    SizedBox(
                      width: 165,
                      child: Text(
                        'Water - 15฿ / Bottle: ',
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
                        controller: waterCtrl,
                        enabled: drinksCheck == 1 ? false : true,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(
                          suffix: Text(
                            ' Bottles',
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
                    'Membership',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.015,
                ),
                DropdownButton(
                  value: showDiscount,
                  isExpanded: true,
                  items: memberType
                      .map((e) => DropdownMenuItem(
                            child: Text(
                              e,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            value: memberType.indexOf(e).toDouble(),
                          ))
                      .toList(),
                  onChanged: (v) {
                    int index = v!.toInt();
                    setState(() {
                      showDiscount = v!;
                      switch (index) {
                        case 0.0:
                          discount = 0;
                          break;
                        case 1.0:
                          discount = 0.05;
                          break;
                        case 2.0:
                          discount = 0.2;
                          break;
                      }
                    });
                  },
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.025,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.calculate,
                        ),
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(
                            double.infinity,
                            50,
                          ),
                          backgroundColor: Colors.deepOrangeAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        label: Text(
                          'Calculate',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      flex: 2,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          if (imgFile == null){

                          }else if(adultCheck == true && adultCtrl.text == '0' || adultCtrl.text.isEmpty){

                          }else if(childCheck == true && childCtrl.text == '0' || childCtrl.text.isEmpty){

                          }
                          int adult = int.parse(adultCtrl.text);
                          int child = int.parse(childCtrl.text);
                          int coke = int.parse(cokeCtrl.text);
                          int waterr = int.parse(waterCtrl.text);
                          double payWaterBuffet = drinksCheck == 1 ? 25.0 * (adult+child) : 0;
                          double payTotal = (299.0*adult) + (69.0*child) + (20.0*coke) + (15.0*waterr) + payWaterBuffet;
                          payTotal = payTotal - (payTotal*discount);

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ShowBillUI(
                                payTotal: payTotal,
                                imgFile: imgFile,
                              )
                            ),
                          );

                        },
                        icon: Icon(
                          Icons.cancel,
                        ),
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(
                            double.infinity,
                            50,
                          ),
                          backgroundColor: Colors.tealAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        label: Text(
                          'Cancel',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
