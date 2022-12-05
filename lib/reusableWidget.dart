import 'package:flutter/material.dart';

Widget organs({required double width}) {
  return Container(
    width: width,
    height: 50,
    decoration: BoxDecoration(
        // color: Colors.blue,
        border: Border.all(color: Colors.black, width: 3),
        borderRadius: BorderRadius.circular(300)),
  );
}
