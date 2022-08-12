import 'package:flutter/material.dart';
import 'package:flutter_bloc_project/component/tools/constants.dart';

class OrDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
      width: size.width * 0.8,
      child: Row(
        children: [buildDivider(), buidOrText(), buildDivider()],
      ),
    );
  }

  Expanded buildDivider() {
    return Expanded(
      child: Divider(
        color: lineColor,
        height: 1.5,
      ),
    );
  }

  Padding buidOrText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        "OR",
        style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.w600),
      ),
    );
  }
}
