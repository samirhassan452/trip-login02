import 'package:flutter/material.dart';
import 'package:login2_ui/const.dart';
import 'package:login2_ui/views/auth/customButton.dart';
import 'package:login2_ui/views/auth/customTextField.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  String name = "Samir";
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        buildHeader(width, height),
        SizedBox(
          height: height * 0.04,
        ),
        CustomTextField(
          textType: "Password",
          textIcon: Icons.vpn_key_outlined,
          keyboardType: TextInputType.visiblePassword,
        ),
        SizedBox(
          height: height * 0.02,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: () {},
            child: Text(
              "Forgot Password?",
              style: TextStyle(color: Colors.orange),
            ),
          ),
        ),
        SizedBox(
          height: height * 0.05,
        ),
        BuildCustomButton(
            width: width,
            text: "Sign In",
            onClick: () {},
            backgroundColor: primaryButtonColor,
            textColor: Colors.white),
        SizedBox(
          height: height * 0.03,
        ),
        Text(
          "or sing in with",
          style: TextStyle(color: Colors.grey[500]),
        ),
        SizedBox(
          height: height * 0.01,
        ),
        buildSocialNetworksButtons(width)
      ],
    );
  }

  Row buildSocialNetworksButtons(double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
            onTap: () {},
            child: buildCircleImage(24, 24, "assets/images/google.png")),
        SizedBox(
          width: width * 0.03,
        ),
        GestureDetector(
            onTap: () {},
            child: buildCircleImage(24, 24, "assets/images/facebook.png")),
        SizedBox(
          width: width * 0.03,
        ),
        GestureDetector(
            onTap: () {},
            child: buildCircleImage(24, 24, "assets/images/twitter.png")),
      ],
    );
  }

  Container buildCircleImage(double width, double height, String imgPath) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(fit: BoxFit.fill, image: AssetImage(imgPath))),
    );
  }

  Row buildHeader(double width, double height) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(
            "Welcome Back $name",
            style:
                TextStyle(fontWeight: FontWeight.bold, fontSize: width * 0.07),
          ),
        ),
        Expanded(
            child:
                buildCircleImage(0, height * 0.12, "assets/images/samir.jpg"))
      ],
    );
  }
}
