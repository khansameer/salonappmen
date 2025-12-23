import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:salonman/core/constants/color_utils.dart';
import 'package:salonman/core/routes/app_routes.dart';
import 'package:salonman/core/widgets/component.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: 0),
      children: [
        SizedBox(height: 0),
        authHeading(
          subTitle: "Please type full information below",
        ),
        SizedBox(height: 20),
        _formView(),

        SizedBox(height: 40),
        commonButton(text: "Create", onPressed: () {}),
        SizedBox(height: 30),
        Align(
          alignment: .center,
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(text: 'Already have an account? '),
                TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.pushNamed(context, RouteName.loginScreen);
                    },
                  text: 'Sign in',
                  style: commonTextStyle(
                    color: colorOrange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                //TextSpan(text: ' world!'),
              ],
            ),
          ),
        ),
        SizedBox(height: 30),
      ],
    );
  }

  Widget _formView() {
    return Column(
      spacing: 8,
      children: [
        commonTextFieldView(text: "Name"),
        commonTextFieldView(text: "Email"),
        commonTextFieldView(text: "Mobile Number"),
        commonTextFieldView(text: "Password"),
        commonTextFieldView(text: "Confirm Password"),
      ],
    );
  }
}
