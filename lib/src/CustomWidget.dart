import 'package:flutter/material.dart';

class Setting_Element extends StatefulWidget {
  String Name;
  Setting_Element({required this.Name});

  @override
  State<Setting_Element> createState() => Setting_ElementState();
}
class Setting_ElementState extends State<Setting_Element> {
  bool Condition = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(widget.Name,style: TextStyle(fontSize: 16,color: Color.fromARGB(255, 100, 100, 100),fontWeight:FontWeight.w800)),
        Switch(
            activeColor: Color.fromARGB(255,101, 40, 247),
            value: Condition,
            onChanged: (value){
              setState(() {
                Condition = value;
              });
            }
        ),
      ],
    );
  }
}