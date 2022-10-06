// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, use_key_in_widget_constructors, unnecessary_new

import 'package:flutter/material.dart';
import 'package:woss_health_care/Common/ColorPalette.dart';
import 'package:woss_health_care/Common/CommonLocal.dart';
import 'package:woss_health_care/Model/UserModel.dart';
import 'package:woss_health_care/View/doctor_home_page.dart';

import '../main.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController phoneController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    phoneController.text = '0393338069';
  }

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            currentFocus.focusedChild?.unfocus();
          }
        },
        child: Container(
          width: deviceSize.width,
          height: deviceSize.height,
          color: AppColor.grayScale00,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(48),
                      color: AppColor.grayScale50,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.arrow_back_ios_rounded,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 60),
                Image.asset('assets/Logo.png'),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Welcome \nback!',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 40,
                    fontWeight: FontWeight.w600,
                    color: AppColor.grayScale950,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Phone',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColor.grayScale600,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                textField(
                    phoneController,
                    TextInputType.phone,
                    Icon(
                      Icons.phone_outlined,
                      color: AppColor.grayScale400,
                    ),
                    'Your phone',
                    false,
                    false),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Password',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColor.grayScale600,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                textField(
                    passwordController,
                    TextInputType.text,
                    Icon(
                      Icons.lock_outline,
                      color: AppColor.grayScale400,
                    ),
                    '********',
                    true,
                    true),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: deviceSize.width,
                  child: Text(
                    'Forgot Password?',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColor.grayScale600,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: deviceSize.width,
                  height: 48,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(AppColor.primary500),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                    ),
                    onPressed: () {
                      if (phoneController.text == '0393338069') {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => MyHomePage(),
                          ),
                        );
                      } else {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => HomePageDoctor(),
                          ),
                        );
                      }
                    },
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColor.grayScale00,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  width: deviceSize.width,
                  child: Text(
                    'Connect with your social account',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColor.grayScale600,
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      linkSocialAccount('assets/facebook.png'),
                      SizedBox(width: 20),
                      linkSocialAccount('assets/google.png'),
                      SizedBox(width: 20),
                      linkSocialAccount('assets/apple.png')
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget linkSocialAccount(String assetsPath) {
    return Container(
      width: 54,
      height: 54,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: AppColor.grayScale50,
      ),
      child: Image.asset(assetsPath),
    );
  }

  Widget textField(
    TextEditingController textEditingController,
    TextInputType typeInput,
    Icon prefixIcon,
    String hintText,
    bool isSecure,
    bool isPasswordField,
  ) {
    // var deviceSize = MediaQuery.of(context).size;

    return Center(
      child: TextField(
        controller: textEditingController,
        obscureText: isSecure,
        keyboardType: typeInput,
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 14,
          color: AppColor.grayScale950,
        ),
        decoration: InputDecoration(
            prefixIcon: prefixIcon,
            suffixIcon: (isPasswordField)
                ? IconButton(
                    icon: Icon(
                      (isSecure)
                          ? Icons.remove_red_eye_outlined
                          : Icons.remove_red_eye_rounded,
                      color: AppColor.grayScale400,
                    ),
                    onPressed: () {
                      setState(() {
                        isSecure = !isSecure;
                      });
                    },
                  )
                : null,
            hintText: hintText,
            hintStyle: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 14,
              color: AppColor.grayScale400,
            ),
            filled: true,
            // fillColor: Colors.white.withOpacity(0.8),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            contentPadding:
                EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0)),
      ),
    );
  }
}
