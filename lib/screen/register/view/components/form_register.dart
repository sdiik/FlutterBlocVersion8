import 'package:flutter/material.dart';
import 'package:flutter_bloc_project/component/widgets/already_have_account_check.dart';
import 'package:flutter_bloc_project/component/widgets/rounded_button.dart';
import 'package:flutter_bloc_project/component/widgets/rounded_form_input_field.dart';
import 'package:flutter_bloc_project/screen/login/view/login_view.dart';
import 'package:flutter_svg/svg.dart';

import 'social/social_media_signup.dart';

class FormRegister extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: size.height * 0.1),
            Text(
              "REGISTER",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/signup.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedFormInputField(
              hintText: "Username",
              icon: Icons.person,
              isPassword: false,
              onValidator: (value) {
                if (value!.isEmpty) {
                  return "Username is required";
                }
                return null;
              },
            ),
            RoundedFormInputField(
              hintText: "Email",
              icon: Icons.email,
              isPassword: false,
              onValidator: (value) {
                if (value!.isEmpty) {
                  return "Email is required";
                }
                return null;
              },
            ),
            RoundedFormInputField(
              hintText: "Phone Number",
              icon: Icons.person,
              isPassword: false,
              isPhoneNumber: true,
            ),
            RoundedFormInputField(
              hintText: "Password",
              icon: Icons.key,
              isPassword: true,
              onValidator: (value) {
                if (value!.isEmpty) {
                  return "Password is required";
                }
                return null;
              },
            ),
            RoundedFormInputField(
              hintText: "Verify Password",
              icon: Icons.key,
              isPassword: true,
              onValidator: (value) {
                if (value!.isEmpty) {
                  return "Verify password is required";
                }
                return null;
              },
            ),
            RoundedButton(
                text: "Register",
                press: () {
                  _registersTapped(context);
                }),
            AlreadyHaveAccountCheck(
                login: false,
                press: () {
                  _navigateToLoginPage(context);
                }),
            SosialMediaSignUp(),
            SizedBox(height: size.height * 0.1)
          ],
        ));
  }

  void _registersTapped(BuildContext context) {
    if (_formKey.currentState!.validate()) {}
  }

  void _navigateToLoginPage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return LoginScreen();
    }));
  }
}
