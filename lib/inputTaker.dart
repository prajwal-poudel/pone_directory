import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class InputTaker extends StatefulWidget {
  const InputTaker({Key? key}) : super(key: key);

  @override
  State<InputTaker> createState() => _InputTakerState();
}

enum Gender { Male, Female, Others }

class _InputTakerState extends State<InputTaker> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  bool obsecureText = true;
  Gender selectedGender = Gender.Female;
  bool acceptTermsAndCondition = false;
  static List<String> country = [
    "Nepal",
    "India",
    "China",
    "Pakistan",
    "Hong Kong",
    "Bangladesh"
  ];
  String selectedCountry = country.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Input Form"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        width: double.infinity,
        // color: Colors.red,
        child: Column(
          children: [
            TextFormField(
              controller: usernameController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                labelText: "UserName",
                hintText: "",
                hintStyle: TextStyle(fontFamily: "Cardo"),
                helperText: "Free",
              ),
            ),
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
                labelText: "Email",
                hintText: "",
                hintStyle: TextStyle(fontFamily: "Cardo"),
                helperText: "valid Email Address",
              ),
            ),
            TextFormField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.phone),
                labelText: "Pone Number",
                hintText: "",
                hintStyle: TextStyle(fontFamily: "Cardo"),
                helperText: "Min 8 digit",
              ),
            ),
            Container(
              height: 50,
              width: double.infinity,
              // color: Colors.red,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Radio<Gender>(
                            splashRadius: 10,
                            value: Gender.Male,
                            groupValue: selectedGender,
                            onChanged: (Gender? val) {
                              setState(() {
                                selectedGender = val!;
                              });
                            }),
                        Text("Male")
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Radio<Gender>(
                            splashRadius: 10,
                            value: Gender.Female,
                            groupValue: selectedGender,
                            onChanged: (Gender? val) {
                              setState(() {
                                selectedGender = val!;
                              });
                            }),
                        Text("Female")
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Radio<Gender>(
                            splashRadius: 10,
                            value: Gender.Others,
                            groupValue: selectedGender,
                            onChanged: (Gender? val) {
                              setState(() {
                                selectedGender = val!;
                              });
                            }),
                        Text("Others")
                      ],
                    ),
                  ),
                ],
              ),
            ),
            DropdownButtonHideUnderline(
              child: DropdownButton(
                  // icon: Icon(Icons.arrow_downward),

                  value: selectedCountry,
                  items: country.map<DropdownMenuItem<String>>((String val) {
                    return DropdownMenuItem(
                        value: val,
                        child: Text(
                          val,
                        ));
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      selectedCountry = value!;
                    });
                  }),
            ),
            TextFormField(
              controller: passwordController,
              keyboardType: TextInputType.visiblePassword,
              obscuringCharacter: "*",
              obscureText: obsecureText,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        obsecureText = !obsecureText;
                      });
                    },
                    icon: Icon(
                      obsecureText
                          ? Icons.remove_red_eye
                          : Icons.elderly_outlined,
                    )),
                labelText: "Password",
                hintText: "",
                hintStyle: TextStyle(fontFamily: "Cardo"),
                helperText: "Minimum 8 character long",
              ),
            ),
            Row(
              children: [
                Checkbox(
                    value: acceptTermsAndCondition,
                    onChanged: (bool? val) {
                      setState(() {
                        acceptTermsAndCondition = val!;
                      });
                    }),
                Text("Accept Terms and Conditions")
              ],
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
                onPressed: () {}, icon: Icon(Icons.login), label: Text("Login"))
          ],
        ),
      ),
    );
  }
}
