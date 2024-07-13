
import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  String dropdownValue = 'Content Language';
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        padding: const  EdgeInsets.fromLTRB(10, 10, 10,10),
        child: DropdownButton<String>(
          value: dropdownValue,
          onChanged: (String? newValue) {
            setState(() {
              dropdownValue = newValue!;
            });
          },
          items: <String>['Content Language', 'English', 'Hindi']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),

        ),
      ),
    ],);
  }
}
