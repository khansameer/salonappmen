import 'package:flutter/material.dart';
import 'package:salonman/core/widgets/component.dart';

import '../../core/constants/color_utils.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: 0),
      children: [
        commonText(
          text: "Please enter your email to receive OTP",
          fontSize: 14,
          color: colorTextLight,
        ),

        SizedBox(height: 10),
        commonTextFieldView(text: "Email"),

        SizedBox(height: 40),
        commonButton(text: "Send Code", onPressed: () {}),
        SizedBox(height: 40),
      ],
    );
  }


}
