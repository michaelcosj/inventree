import 'package:flutter/material.dart';
import 'package:inventree/utils/constants.dart';
import 'package:inventree/widgets/material_custom_button.dart';

class PopupDialog extends StatelessWidget {
  const PopupDialog({@required this.children, @required this.onPressed});

  final List<Widget> children;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('ADD BUYER'),
      titleTextStyle: kProductDetailsTextStyle,
      content: SingleChildScrollView(
        child: ListBody(children: children),
      ),
      actions: [
        MaterialCustomButton(
          onPressed: onPressed,
          label: 'Add',
        )
      ],
    );
  }
}
