import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key key, this.textType, this.textIcon, this.keyboardType})
      : super(key: key);

  final String textType;
  final IconData textIcon;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.orange[200],
      obscureText: textType == "Password" ? true : false,
      autofocus: false,
      keyboardType: keyboardType,
      decoration: InputDecoration(
          hintText: textType,
          prefixIcon: Container(
            transform: Matrix4.translationValues(-12.0, 0.0, 0.0),
            child: Icon(
              textIcon,
              color: Colors.black,
            ),
          ),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.orange, width: 0.3)),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.orange, width: 0.3))),
    );
  }
}
