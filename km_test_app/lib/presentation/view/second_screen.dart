import 'package:flutter/material.dart';
import 'package:km_test_app/core/constant/textstyle.dart';
import 'package:km_test_app/presentation/viewmodel/user_viewmodel.dart';
import 'package:km_test_app/presentation/widgets/appbar_widget.dart';
import 'package:km_test_app/presentation/widgets/button_widget.dart';
import 'package:provider/provider.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String userName =
        ModalRoute.of(context)?.settings.arguments as String;

    return Scaffold(
      appBar: const AppbarWidget(
        title: 'Second Screen',
      ),
      body: Padding(
        padding: const EdgeInsets.all(
          16.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome',
              style: CustomStyle().regularText,
            ),
            Text(
              (userName.isEmpty) ? 'No Name' : userName,
              style: CustomStyle().h2Text,
            ),
            Expanded(
              child: Center(
                child: Consumer<UserViewModel>(
                  builder: (context, userViewModel, child) {
                    return Text(
                      (userViewModel.selectedUserName ?? 'Selected User Name'),
                      style: CustomStyle().h1Text,
                    );
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: ButtonWidget(
                onPress: () {
                  Navigator.pushNamed(
                    context,
                    '/third',
                  );
                },
                text: 'Choose a User',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
