import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types, use_key_in_widget_constructors
class add extends StatefulWidget {
  @override
  State<add> createState() => _addState();
}

// ignore: camel_case_types
class _addState extends State<add> {
  TextEditingController name = TextEditingController();
  TextEditingController div = TextEditingController();
  TextEditingController rolln = TextEditingController();

  CollectionReference ref = FirebaseFirestore.instance.collection('users');
  var ww = '1A';
  var options = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
  ];
  var _currentItemSelected = "1";
  var rool = "1";

  var options1 = [
    'A',
    'B',
  ];
  var _currentItemSelected1 = "A";
  var rool1 = "A";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a student'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(border: Border.all()),
            child: TextField(
              textAlign: TextAlign.center,
              controller: name,
              decoration: const InputDecoration(
                hintText: 'Name',
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(border: Border.all()),
            child: TextField(
              textAlign: TextAlign.center,
              controller: rolln,
              decoration: const InputDecoration(
                hintText: 'Roll Number',
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  const Text('Class : '),
                  DropdownButton<String>(
                    dropdownColor: Colors.blueAccent,
                    isDense: true,
                    isExpanded: false,
                    iconEnabledColor: const Color.fromARGB(255, 1, 1, 255),
                    focusColor: const Color.fromARGB(255, 0, 17, 251),
                    items: options.map((String dropDownStringItem) {
                      return DropdownMenuItem<String>(
                        value: dropDownStringItem,
                        child: Text(
                          dropDownStringItem,
                          style: const TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (newValueSelected) {
                      setState(() {
                        _currentItemSelected = newValueSelected!;
                        rool = newValueSelected;

                        ww = '';
                        ww = _currentItemSelected + _currentItemSelected1;
                      });
                      // ignore: avoid_print
                      print(ww);
                    },
                    value: _currentItemSelected,
                  ),
                ],
              ),
              const SizedBox(
                width: 35,
              ),
              Row(
                children: [
                  const Text('Div : '),
                  DropdownButton<String>(
                    dropdownColor: Colors.blueAccent,
                    isDense: true,
                    isExpanded: false,
                    iconEnabledColor: Colors.blue[900],
                    focusColor: Colors.blue[900],
                    items: options1.map((String dropDownStringItem) {
                      return DropdownMenuItem<String>(
                        value: dropDownStringItem,
                        child: Text(
                          dropDownStringItem,
                          style: const TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (newValueSelected1) {
                      setState(() {
                        _currentItemSelected1 = newValueSelected1!;
                        rool1 = newValueSelected1;
                        ww = '';
                        ww = _currentItemSelected + _currentItemSelected1;
                      });
                      // ignore: avoid_print
                      print(ww);
                    },
                    value: _currentItemSelected1,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          MaterialButton(
            color: Colors.blue,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)),
            onPressed: () {
              ref.add({
                'name': name.text,
                'div': ww,
                'roll': rolln.text,
              });
            },
            child: const Text(
              'ADD',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
