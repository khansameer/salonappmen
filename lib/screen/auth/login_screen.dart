import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:salonman/core/constants/color_utils.dart';
import 'package:salonman/core/constants/image_utils.dart';
import 'package:salonman/core/routes/app_routes.dart';
import 'package:salonman/core/widgets/component.dart';
import 'package:salonman/screen/auth/forgot_password.dart';
import 'package:salonman/screen/auth/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return commonScaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          padding: EdgeInsets.symmetric(horizontal: 24),
          height: MediaQuery.sizeOf(context).height,
          child: Column(
            mainAxisAlignment: .center,
            crossAxisAlignment: .center,
            //padding: EdgeInsets.symmetric(horizontal: 24),
            children: [
              SizedBox(height: 100),
              commonAssetImage(icLogo,width: 250,height: 100,fit: BoxFit.contain),
              SizedBox(height: 40),
              commonText(text: "Welcome back,",fontSize: 25,fontWeight: .bold,),
              authHeading(),
              SizedBox(height: 20),
              _formView(),
              SizedBox(height: 5),
              Align(
                alignment: .topRight,

                child: commonInkWell(
                  onTap: () {
                    showCommonBottomSheet(
                      title: "Forgot Password",
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      context: context,
                      content: SizedBox(

                        child: ForgotPassword(),
                      ),
                    );

                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: commonText(
                      text: "Forgot Password?",
                      fontSize: 14,
                      color: colorBg,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 56),
              commonButton(text: "Sign in", onPressed: () {
                Navigator.pushReplacementNamed(context, RouteName.dashboardScreen);
              }),
              SizedBox(height: 40),
              Align(
                alignment: .center,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: 'Don’t have an account? '),
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            showCommonBottomSheet(
                              title: "Create an account",
                              padding: EdgeInsets.symmetric(horizontal: 24),
                              context: context,
                              content: SizedBox(

                                child: SignupScreen(),
                              ),
                            );
                            // Navigator.pushNamed(context, RouteName.signUpScreen);
                          },
                        text: 'Sign up',
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
            ],
          ),
        ),
      ),
    );
  }

  Widget _formView() {
    return Column(
      spacing: 12,
      children: [
        commonTextFieldView(text: "Email"),
        commonTextFieldView(text: "Password"),
      ],
    );
  }
}
