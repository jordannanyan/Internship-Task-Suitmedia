import 'package:flutter/material.dart';
import 'package:km_test_app/core/constant/colorstyle.dart';
import 'package:km_test_app/core/constant/textstyle.dart';

class TextfieldWidget extends StatelessWidget {
  final TextEditingController textController;
  final String hint;
  const TextfieldWidget({
    super.key,
    required this.textController,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      decoration: InputDecoration(
        hintStyle: CustomStyle().hintText,
        hintText: hint,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(
            12.0,
          ),
        ),
        filled: true,
        fillColor: ColorStyle().primaryColor,
      ),
    );
  }
}
