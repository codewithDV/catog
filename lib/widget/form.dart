import 'package:flutter/material.dart';

class CustomData extends StatelessWidget {
  final TextEditingController? controller;
  final IconData? data;
  final String? hintext;
  bool isObsecure = true;

  CustomData(
      {Key? key,
      this.controller,
      this.data,
      required this.isObsecure,
      this.hintext})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        obscureText: isObsecure,
        decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(
              data,
              color: Theme.of(context).primaryColor,
            ),
            focusColor: Theme.of(context).primaryColor,
            hintText: hintext),
      ),
    );
  }
}
