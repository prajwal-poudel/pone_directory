import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Screen extends StatefulWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  Color screenColor = Colors.white;
  List colorDetails01 = [
    {"id": 1, "color": Colors.red, "name": "Red"},
    {"id": 2, "color": Colors.orange, "name": "Orange"},
    {"id": 3, "color": Colors.grey, "name": "Grey"},
    {"id": 4, "color": Colors.purple, "name": "Purple"},
    {"id": 5, "color": Colors.pink, "name": "Pink"},
    {"id": 6, "color": Colors.blue, "name": "Blue"},
  ];

  List colorDetails02 = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
                color: screenColor,
                border: Border.all(color: Colors.black, width: 3)),
          ),
          /**
           * buttons to change background color of screen....
           */
          SizedBox(
            height: 100,
          ),
          GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 5,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: colorDetails01.asMap().entries.map((e) {
                return ElevatedButton(
                    onPressed: () {
                      setState(() {
                        screenColor = e.value["color"];
                      });
                    },
                    child: Text(e.value["name"]));
              }).toList()),
          Text(
            "This is default Font!!!",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            "This is Manual Font!!!",
            style: TextStyle(
                fontFamily: "Cardo",
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic),
          ),
          Expanded(
              child: Container(
            color: Colors.red,
            child: Image(image: AssetImage("assets/images/second.webp")),
          ))
        ],
      ),
    );
  }
}
