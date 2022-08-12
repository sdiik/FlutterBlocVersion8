import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_project/screen/somethingWentWrong/view/something_went_wrong_view.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../bloc/login_bloc.dart';
import 'components/body.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocListener<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state.loading == true) {
                EasyLoading.show();
              } else {
                EasyLoadingStatus.dismiss;
                if (state.error?.status == true) {
                  EasyLoading.dismiss();
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.error?.value ?? "")));
                } else if (state.isAuthenticated == true) {
                  EasyLoading.dismiss();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SomethingWentWrongView()));
                }
              }
            },
            child: Body()));
  }
}
