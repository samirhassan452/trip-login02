import 'package:flutter/material.dart';

class BuildCustomButton extends StatelessWidget {
  const BuildCustomButton(
      {Key key,
      @required this.width,
      @required this.text,
      @required this.onClick,
      @required this.backgroundColor,
      @required this.textColor})
      : super(key: key);

  final double width;
  final String text;
  final Function onClick;
  final Color textColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        width: width,
        padding: EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
            color: backgroundColor, borderRadius: BorderRadius.circular(24)),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: width * 0.05),
        ),
      ),
    );
  }
}
