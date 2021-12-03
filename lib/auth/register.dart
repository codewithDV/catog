import 'dart:io';

import 'package:catlog_flutter/widget/dialog.dart';
import 'package:catlog_flutter/widget/form.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController nameText = TextEditingController();
  final TextEditingController EmailText = TextEditingController();
  final TextEditingController PassText = TextEditingController();
  final TextEditingController ConPassText = TextEditingController();
  final GlobalKey<FormState> _foramkey = GlobalKey<FormState>();
  String ImageUrl = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                InkWell(
                  onTap: () {
                    // openGallery();
                  },
                  child: CircleAvatar(
                    radius: MediaQuery.of(context).size.width * 0.25,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.10,
                ),
                Form(
                  key: _foramkey,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        CustomData(
                          isObsecure: false,
                          controller: nameText,
                          data: Icons.supervised_user_circle,
                          hintext: "Name",
                        ),
                        CustomData(
                          isObsecure: false,
                          controller: EmailText,
                          data: Icons.email,
                          hintext: "Email",
                        ),
                        CustomData(
                          isObsecure: true,
                          controller: PassText,
                          data: Icons.password_outlined,
                          hintext: "Password",
                        ),
                        CustomData(
                          isObsecure: true,
                          controller: ConPassText,
                          data: Icons.password,
                          hintext: "Confirm Password",
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        ElevatedButton(
                            onPressed: () {}, child: const Text("Sign Up"))
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
