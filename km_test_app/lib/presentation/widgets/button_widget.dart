import 'package:flutter/material.dart';
import 'package:km_test_app/core/constant/colorstyle.dart';
import 'package:km_test_app/core/constant/textstyle.dart';

class ButtonWidget extends StatelessWidget {
  final Function() onPress;
  final String text;
  const ButtonWidget({
    super.key,
    required this.onPress,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(
            ColorStyle().secondaryColor,
          ),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                12.0,
              ),
            ),
          ),
        ),
        onPressed: onPress,
        child: Text(
          text,
          style: CustomStyle().buttonText,
        ),
      ),
    );
  }
}
