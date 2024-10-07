import 'package:flutter/material.dart';


class Background2 extends StatelessWidget {
  final Widget child;
  const Background2({
    Key key,
    @required this.child,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            width: size.width *0.4,
            top: 100,
            right: 220,
            child: Text('Your Result',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold
              ),),
          ),
      Positioned(
            top: 0,
            right: 0,
            child: Image.asset(
                "assets/images/top2.png",
                width: size.width
            ),
          ),

          Positioned(
            top: 60,
            right: 30,
            child: Image.asset(
                "assets/images/epoxy2.png",
                width: size.width * 0.55
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