import 'package:flutter/material.dart';
import 'package:flutter_bloc_project/component/tools/constants.dart';

class AlreadyHaveAccountCheck extends StatelessWidget {
  final bool login;
  final Function press;

  const AlreadyHaveAccountCheck({
    Key? key,
    required this.login,
    required this.press
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          login ? "Don't have an account ? " : "Already have an Account? ",
          style: TextStyle(color: kPrimaryColor),
        ),
        GestureDetector(
          onTap: press as void Function()?,
          child: Text(
            login ? "Sign Up" : "Sign In",
            style: TextStyle(
                color: kPrimaryColor,
                fontWeight: FontWeight.bold
            ),
          ),
        )
      ],
    );
  }

}