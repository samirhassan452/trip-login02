import 'package:flutter/material.dart';

class CustomHomePage extends StatelessWidget {
  const CustomHomePage(
      {@required this.backgroundImage, @required this.content});

  final AssetImage backgroundImage;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(image: backgroundImage, fit: BoxFit.cover)),
        child: Padding(
          padding: EdgeInsets.only(
              top: height * 0.15, right: width * 0.14, left: width * 0.14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Enjoy the trip with me",
                style: TextStyle(color: Colors.white, fontSize: width * 0.1),
              ),
              content
            ],
          ),
        ),
      ),
    );
  }
}
