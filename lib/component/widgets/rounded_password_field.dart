import 'package:flutter/material.dart';
import 'package:flutter_bloc_project/component/tools/constants.dart';
import 'package:flutter_bloc_project/component/widgets/text_field_container.dart';

class RoundedPasswordField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChange;

  const RoundedPasswordField({
    Key? key,
    required this.hintText,
    this.icon = Icons.key,
    required this.onChange
  }): super(key: key);

  Widget build(BuildContext context) {
    return TextFieldContainer(
        child: TextField(
          onChanged: onChange,
          decoration: InputDecoration(
            icon: Icon(
              icon,
              color: kPrimaryColor,
            ),
            hintText: hintText,
            border: InputBorder.none
          ),
          obscureText: true,
        )
    );
  }
}