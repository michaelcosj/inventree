import 'package:flutter/material.dart';
import 'package:inventree/utils/constants.dart';

class MaterialCustomButton extends StatelessWidget {
  final Function onPressed;
  final String label;

  MaterialCustomButton({@required this.onPressed, @required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        color: kAppBackgroudColour,
        borderRadius: BorderRadius.circular(30),
        elevation: 5,
        child: FlatButton(
          onPressed: onPressed,
          child: Text(
            label,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
