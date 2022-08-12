import 'package:flutter/material.dart';
import 'package:flutter_bloc_project/component/widgets/rounded_button.dart';
import 'package:flutter_bloc_project/screen/login/view/login_view.dart';
import 'package:flutter_bloc_project/screen/register/view/register_view.dart';
import 'package:flutter_svg/svg.dart';

import 'background.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // This size provide us total height and width of our screen
    Size size = MediaQuery.of(context).size;
    return Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "WELCOME TO MY APP",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.05),
              SvgPicture.asset(
                'assets/icons/chat.svg',
                height: size.height * 0.5,
              ),
              SizedBox(height: size.height * 0.05),
              RoundedButton(
                text: "LOGIN",
                press: ()  {
                  _navigateToLoginSceen(context);
                }
              ),
              SizedBox(height: 8),
              RoundedButton(
                  text: "REGISTER",
                  press: ()  {
                    _navigateToRegisterScreen(context);
                  }
              ),
            ],
          ),
        )
    );
  }

  void _navigateToLoginSceen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  void _navigateToRegisterScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => RegisterScreen()));
  }



}