import 'package:first_project/inputTaker.dart';
import 'package:first_project/mouth.dart';
import 'package:first_project/overlapingWidget.dart';
import 'package:first_project/phoneDirectory.dart';
import 'package:first_project/screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.purple, fontFamily: "Cardo"),
      home: const PhoneDirectory(),
    );
  }
}

/**
 * @dev learning about container Widget...
 */

class LearnContainer extends StatelessWidget {
  const LearnContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Container(
          alignment: Alignment.center,
          height: 40,
          width: 150,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(150),
            // border: Border.all(color: Colors.purple),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  offset: Offset(3, 5),
                  spreadRadius: 3,
                  blurRadius: 5),
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  offset: Offset(-3, -5),
                  spreadRadius: 3,
                  blurRadius: 5),
            ],
            // image: DecorationImage(
            //     image: NetworkImage(
            //         "https://images.pexels.com/photos/2662116/pexels-photo-2662116.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"),
            //     fit: BoxFit.cover)
          ),
          child: Text(
            "Login",
            style: TextStyle(
                color: Colors.purple,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    ));
  }
}

class ClickButton extends StatelessWidget {
  const ClickButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: () {}, child: Text("Elevated Button")),
            RaisedButton(
              onPressed: () {},
              child: Text("Raised Button"),
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.roofing)),
            ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.login),
                label: Text("Elevated Button.Icon")),
            FlatButton(onPressed: () {}, child: Text("Flat Button")),
            TextButton(
                onPressed: () {},
                child: Text(
                  "Text Button",
                )),
            TextButton.icon(
                onPressed: () {},
                icon: Icon(Icons.facebook_outlined),
                label: Text("Text Button.Icon")),
            InkWell(
              splashColor: Colors.white.withOpacity(0.5),
              overlayColor:
                  MaterialStateProperty.all(Colors.pink.withOpacity(0.5)),
              onTap: () {
                print("Container Clicked!!");
              },
              child: Container(
                alignment: Alignment.center,
                height: 40,
                width: 120,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  "Click Me!!",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Material(
              elevation: 2.5,
              type: MaterialType.card,
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              child: MaterialButton(
                splashColor: Theme.of(context).primaryColor,
                onPressed: () {},
                child: Container(
                  padding: EdgeInsets.all(10),
                  height: 100,
                  width: 200,
                  child: Text(
                    "Clidddsdsds!!",
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}

class RowColumnExample extends StatelessWidget {
  const RowColumnExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        width: double.infinity,
        // color: Colors.amber,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 300,
              color: Colors.orange,
            ),
            Card(
              elevation: 2,
              child: Container(
                height: 100,
                width: 280,
                color: Colors.purple,
              ),
            ),
            Container(
              // margin: EdgeInsets.only(top: 10),
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"),
                      fit: BoxFit.cover),
                  color: Colors.pink,
                  borderRadius: BorderRadius.circular(50)),
            ),
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                  "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"),
            ),
            Container(
              height: 250,
              // color: Colors.grey,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 120,
                    height: 200,
                    color: Colors.blue,
                  ),
                  Container(
                    width: 120,
                    height: 200,
                    color: Colors.purple,
                  ),
                  Container(
                    width: 120,
                    height: 200,
                    color: Colors.amber,
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
