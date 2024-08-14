import 'package:flutter/material.dart';
import 'package:km_test_app/data/repositories/user_repository.dart';
import 'package:km_test_app/presentation/view/first_screen.dart';
import 'package:km_test_app/presentation/view/second_screen.dart';
import 'package:km_test_app/presentation/view/third_screen.dart';
import 'package:km_test_app/presentation/viewmodel/user_viewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final userRepository = UserRepository();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserViewModel(
            userRepository: userRepository,
          ),
        ),
      ],
      child: MaterialApp(
        title: 'KM Test App',
        theme: ThemeData(
          fontFamily: 'Poppins',
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => FirstScreen(),
          '/second': (context) => const SecondScreen(),
          '/third': (context) => const ThirdScreen(),
        },
      ),
    );
  }
}
