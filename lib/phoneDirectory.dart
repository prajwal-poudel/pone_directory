import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

class PhoneDirectory extends StatefulWidget {
  const PhoneDirectory({Key? key}) : super(key: key);

  @override
  State<PhoneDirectory> createState() => _PhoneDirectoryState();
}

class _PhoneDirectoryState extends State<PhoneDirectory> {
  /* 
  @Dev 
  Image Picer implementatione
  */
  XFile? image;
  final ImagePicker _picker = ImagePicker();
  void pickImage() async {
    XFile? pickImage = await _picker.pickImage(source: ImageSource.camera);

    setState(() {
      image = pickImage;
    });
    // File file =  File(image.readAsBytes(), fileName)
    print(image!.path);
  }

  /* 
  @Dev 
  Image Picer implementatione
  */
  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );

    launchUrl(launchUri);
  }

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  Future<void> _launchInWebViewOrVC(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.inAppWebView,
      webViewConfiguration: const WebViewConfiguration(
          headers: <String, String>{'my_header_key': 'my_header_value'}),
    )) {
      throw 'Could not launch $url';
    }
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  List phoneDetails = [];
  static List<String> codes = ["+977", "+91", "+01", "+111"];
  String selectedCode = codes.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Phone Directory"),
      ),
      body: Container(
        // color: Colors.red,

        child: SingleChildScrollView(
          child: Container(
            height: 670,
            width: double.infinity,
            child: Column(
              children: [
                Container(
                  height: 380,
                  // color: Colors.red,
                  child: ListView(
                    children: phoneDetails.asMap().entries.map((val) {
                      return ListTile(
                        leading: val.value["image"] == null
                            ? Icon(Icons.person)
                            : CircleAvatar(
                                radius: 40,
                                backgroundImage:
                                    FileImage(File(val.value["image"].path))),
                        title: Text(val.value["name"]),
                        subtitle: Text(
                            "${val.value["countryCode"]}-${val.value["phone"]}"),
                        trailing: IconButton(
                            onPressed: () {
                              // Call
                              _makePhoneCall(val.value["phone"].toString());
                              // _launchInWebViewOrVC(
                              //     Uri.parse("https://youtube.com"));
                              // pickImage();
                            },
                            icon: Icon(
                              Icons.phone,
                              color: Colors.green,
                            )),
                      );
                    }).toList(),
                  ),
                ),
                Expanded(
                    child: Container(
                  // color: Colors.red,
                  padding: EdgeInsets.symmetric(horizontal: 30),

                  child: Column(
                    children: [
                      TextFormField(
                        controller: nameController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            labelText: "Name", prefixIcon: Icon(Icons.person)),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          DropdownButtonHideUnderline(
                              child: DropdownButton(
                                  value: selectedCode,
                                  items: codes.map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem(
                                        child: Text(value), value: value);
                                  }).toList(),
                                  onChanged: (select) {
                                    setState(() {
                                      selectedCode = select.toString();
                                    });
                                  })),
                          Container(
                            // height: 20,
                            width: 270,
                            child: TextFormField(
                              controller: phoneController,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                  labelText: "Pone",
                                  prefixIcon: Icon(Icons.phone)),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          if (image != null)
                            CircleAvatar(
                                radius: 35,
                                backgroundImage: FileImage(File(image!.path))),
                          ElevatedButton.icon(
                              onPressed: () {
                                pickImage();
                              },
                              icon: Icon(Icons.image),
                              label: Text("Image"))
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ElevatedButton.icon(
                          onPressed: () {
                            Map<String, dynamic> newData = {
                              "name": nameController.text,
                              "phone": phoneController.text,
                              "countryCode": selectedCode,
                              "image": image
                            };
                            setState(() {
                              phoneDetails.add(newData);
                              image = null;
                            });
                            nameController.clear();
                            phoneController.clear();
                            selectedCode = codes.first;
                          },
                          icon: Icon(Icons.save),
                          label: Text("Save"))
                    ],
                  ),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
