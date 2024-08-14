import 'package:flutter/material.dart';
import 'package:km_test_app/core/constant/colorstyle.dart';

class CustomStyle {
  TextStyle h1Text = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: ColorStyle().mainTextColor,
    fontFamily: 'Poppins',
  );

  TextStyle h2Text = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    fontFamily: 'Poppins',
    color: ColorStyle().mainTextColor,
  );

  TextStyle h3Text = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    fontFamily: 'Poppins',
    color: ColorStyle().mainTextColor,
  );

  TextStyle regularText = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    fontFamily: 'Poppins',
    color: ColorStyle().mainTextColor,
  );

  TextStyle secondaryText = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    fontFamily: 'Poppins',
    color: ColorStyle().secondaryTextColor,
  );

  TextStyle buttonText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontFamily: 'Poppins',
    color: ColorStyle().primaryColor,
  );

  TextStyle hintText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    fontFamily: 'Poppins',
    color: ColorStyle().secondaryTextColor,
  );
}
