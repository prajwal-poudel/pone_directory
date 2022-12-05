import 'package:first_project/reusableWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class OverLaping extends StatelessWidget {
  const OverLaping({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 300,
              // color: Colors.red,
              child: Image.asset("assets/images/first.webp"),
            ),
            Positioned(
                top: 20,
                left: 100,
                child: Text(
                  "Image Text",
                  style: TextStyle(color: Colors.white),
                )),
            Positioned(
              bottom: 20,
              right: 50,
              child: Container(
                  alignment: Alignment.center,
                  height: 30,
                  width: 100,
                  decoration: BoxDecoration(
                      // color: Colors.blue,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: 2, color: Colors.purple)),
                  child: Text(
                    "50% OFF",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
