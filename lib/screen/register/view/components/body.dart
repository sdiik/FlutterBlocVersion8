import 'package:flutter/material.dart';

import 'background.dart';
import 'form_register.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: FormRegister(),
      ),
    );
  }
}
