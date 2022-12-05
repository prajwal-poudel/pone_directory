import 'package:first_project/reusableWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Mouth extends StatelessWidget {
  const Mouth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 300,
          width: double.infinity,
          decoration:
              BoxDecoration(border: Border.all(color: Colors.black, width: 3)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [organs(width: 120), organs(width: 120)],
              ),
              SizedBox(
                height: 40,
              ),
              organs(width: 200)
            ],
          ),
        ),
      ),
    );
  }
}
