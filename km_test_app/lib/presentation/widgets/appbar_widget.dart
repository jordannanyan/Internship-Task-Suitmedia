import 'package:flutter/material.dart';
import 'package:km_test_app/core/constant/colorstyle.dart';
import 'package:km_test_app/core/constant/textstyle.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBackButtonPressed;

  const AppbarWidget({
    super.key,
    required this.title,
    this.onBackButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: IconButton(
        icon: ImageIcon(
          color: ColorStyle().backIconColor,
          const AssetImage(
            'assets/Back.png',
          ),
        ),
        onPressed: onBackButtonPressed ?? () => Navigator.of(context).pop(),
      ),
      titleTextStyle: CustomStyle().h2Text,
      title: Text(title),
      bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: const Color(0xFFE2E3E4),
            height: 1.0,
          )),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
