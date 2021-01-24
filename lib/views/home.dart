import 'package:flutter/material.dart';
import 'package:login2_ui/const.dart';
import 'package:login2_ui/views/auth/customButton.dart';
import 'package:login2_ui/views/auth/login_ui.dart';
import 'package:login2_ui/views/auth/register_ui.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<Offset> offset;

  String signOption;

  @override
  void initState() {
    signOption = "up";
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));

    offset = Tween<Offset>(begin: Offset(0.0, 1.0), end: Offset.zero)
        .animate(controller);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                    image: AssetImage("assets/images/sea.jpg"),
                    fit: BoxFit.cover)),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: height * 0.15, right: width * 0.14, left: width * 0.14),
            child: Text(
              "Enjoy the trip with me",
              style: TextStyle(color: Colors.white, fontSize: width * 0.1),
            ),
          ),
          buildSignButtons(height, width),
          buildAuthBody(height)
        ],
      ),
    );
  }

  Padding buildSignButtons(double height, double width) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: height * 0.15, right: width * 0.14, left: width * 0.14),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          BuildCustomButton(
              width: width,
              text: "Sign Up",
              onClick: () {
                setState(() {
                  signOption = "up";
                });
                controller.forward();
                /*switch (controller.status) {
                      case AnimationStatus.completed:
                        controller.reverse();
                        break;
                      case AnimationStatus.dismissed:
                        controller.forward();
                        break;
                      default:
                    }*/
              },
              backgroundColor: primaryButtonColor,
              textColor: Colors.white),
          SizedBox(
            height: 20,
          ),
          BuildCustomButton(
              width: width,
              text: "Sign In",
              onClick: () {
                setState(() {
                  signOption = "in";
                  controller.forward();
                });
              },
              backgroundColor: Colors.white,
              textColor: primaryButtonColor)
        ],
      ),
    );
  }

  Align buildAuthBody(double height) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SlideTransition(
        position: offset,
        child: Container(
          height: height * 0.65,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(42), topRight: Radius.circular(42))),
          child: Stack(
            children: [
              Positioned(
                  top: 0,
                  right: 25,
                  child: GestureDetector(
                    onTap: () {
                      if (MediaQuery.of(context).viewInsets.bottom != 0) {
                        FocusScope.of(context).unfocus();
                        Future.delayed(const Duration(milliseconds: 800), () {
                          controller.reverse();
                        });
                      } else {
                        controller.reverse();
                      }
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: primaryButtonColor, shape: BoxShape.rectangle),
                      child: Icon(Icons.close, color: Colors.white),
                    ),
                  )),
              Padding(
                padding: EdgeInsets.only(
                    left: 32,
                    right: 32,
                    top: signOption == "up" ? 30 : 45,
                    bottom: 10),
                child: signOption == "up"
                    ? SingleChildScrollView(child: SignUpPage())
                    : SingleChildScrollView(child: SignInPage()),
              )
            ],
          ),
        ),
      ),
    );
  }
}
