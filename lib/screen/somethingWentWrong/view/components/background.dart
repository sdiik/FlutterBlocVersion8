import 'package:flutter/material.dart';
import 'package:flutter_bloc_project/component/tools/constants.dart';

class Background extends StatelessWidget {
  const Background({ Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.center,
      fit: StackFit.expand,
      children: [
        Image.asset(
          "assets/images/something_went_wrong.png",
          fit: BoxFit.cover,
        ),
        Positioned(
            bottom: size.height * 0.05,
            child: TextButton(
              onPressed: ()  {
                _tryAgainTapped(context);
              },
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text("Try Again", style: TextStyle(color: Colors.white)),
                ),
              ),
            )
        )
      ],
    );
  }

  void _tryAgainTapped(BuildContext context) {
    Navigator.pop(context);
  }
}