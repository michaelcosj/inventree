import 'package:flutter/material.dart';
import 'package:inventree/utils/constants.dart';

class AddProductTextField extends StatelessWidget {
  final double width;
  final Function onChanged;
  final String hintText;
  final TextInputType keyboardType;
  AddProductTextField(
      {this.width = 300, this.onChanged, this.hintText, this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: TextField(
        keyboardType: keyboardType,
        cursorColor: kAppBackgroudColour,
        decoration: InputDecoration(
          hintText: hintText,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: kAppBackgroudColour),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: kAppBackgroudColour),
          ),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
