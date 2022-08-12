import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_project/component/widgets/already_have_account_check.dart';
import 'package:flutter_bloc_project/component/widgets/rounded_button.dart';
import 'package:flutter_bloc_project/component/widgets/rounded_form_input_field.dart';
import 'package:flutter_bloc_project/screen/login/bloc/login_bloc.dart';
import 'package:flutter_bloc_project/screen/register/view/register_view.dart';
import 'package:flutter_bloc_project/screen/welcome/welcome_view.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/svg.dart';
import 'background.dart';

part 'form_login.dart';

class Body extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return Background(
          child: SingleChildScrollView(child: FormLogin(formKey: _formKey)));
    });
  }
}
