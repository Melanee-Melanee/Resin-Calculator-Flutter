import 'package:flutter/material.dart';
import 'responsive.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key key,
    @required this.child,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      // padding: isLandscape(context) ? EdgeInsets.symmetric(vertical: 38, horizontal: 42) : EdgeInsets.only(top: 190, right: 80, bottom: 10),
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            width: size.width *0.5,
            height: size.height,
            top: 100,
            right: 190,
            child: Text('Resin Calculator',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold
            ),),
          ),Positioned(
            top: 0,
            right: 0,
            child: Image.asset(
                "assets/images/top2.png",
                width: size.width
            ),
          ),

          Positioned(
            top: 50,
            right: 30,
            child: Image.asset(
                "assets/images/chemistry.png",
                width: size.width * 0.35
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
                "assets/images/top3.png",
                width: size.width
            ),
          ),

          child
        ],

      ),
    );
  }
}