import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import '../tools/constants.dart';
import 'text_field_container.dart';

class RoundedFormInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final bool isPassword;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? onValidator;
  final bool? isPhoneNumber;

  const RoundedFormInputField(
      {Key? key,
      required this.hintText,
      required this.icon,
      required this.isPassword,
      this.onChanged,
      this.isPhoneNumber,
      this.onValidator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isPhoneNumber == true) {
      return TextFieldContainer(
        child: InternationalPhoneNumberInput(
            onInputChanged: (PhoneNumber number) {

            },
            validator: onValidator,
            hintText: hintText,
            ignoreBlank: false,
            autoValidateMode: AutovalidateMode.disabled,
            inputBorder: InputBorder.none),
      );
    } else {
      return TextFieldContainer(
          child: TextFormField(
        onChanged: onChanged,
        validator: onValidator,
        decoration: InputDecoration(
            icon: Icon(
              icon,
              color: kPrimaryColor,
            ),
            hintText: hintText,
            border: InputBorder.none),
        obscureText: isPassword ? true : false,
      ));
    }
  }
}
