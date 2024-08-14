import 'package:flutter/material.dart';
import 'package:km_test_app/core/constant/colorstyle.dart';
import 'package:km_test_app/presentation/widgets/button_widget.dart';
import 'package:km_test_app/presentation/widgets/textfield_widget.dart';

class FirstScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController sentenceController = TextEditingController();

  FirstScreen({super.key});

  bool isPalindrome(String text) {
    String cleanedText = text.replaceAll(RegExp(r'\s+'), '').toLowerCase();
    return cleanedText == cleanedText.split('').reversed.join('');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  'assets/image.png',
                ),
              ),
            ),
          ),
          ListView(
            padding: EdgeInsets.zero,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 16,
                  left: 22,
                  right: 22,
                  bottom: 16,
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 170,
                    ),
                    CircleAvatar(
                      radius: 58,
                      backgroundColor: ColorStyle().whiteColorOp50,
                      child: Icon(
                        size: 30,
                        color: ColorStyle().primaryColor,
                        Icons.person_add_alt_1,
                      ),
                    ),
                    const SizedBox(
                      height: 58,
                    ),
                    TextfieldWidget(
                      textController: nameController,
                      hint: 'Name',
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    TextfieldWidget(
                      textController: sentenceController,
                      hint: 'Palindrome',
                    ),
                    const SizedBox(
                      height: 46,
                    ),
                    ButtonWidget(
                      onPress: () {
                        if (sentenceController.text.isNotEmpty) {
                          bool palindrome =
                              isPalindrome(sentenceController.text);
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Palindrome Check'),
                              content: Text(
                                palindrome
                                    ? 'Is a palindrome'
                                    : 'Not a palindrome',
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          );
                        } else {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text(
                                'Oops',
                              ),
                              content: const Text(
                                'Sentence is empty',
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          );
                        }
                      },
                      text: 'Palindrome',
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    ButtonWidget(
                      onPress: () {
                        if (nameController.text.isNotEmpty) {
                          Navigator.pushNamed(
                            context,
                            '/second',
                            arguments: nameController.text,
                          );
                        } else {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text(
                                'Oops',
                              ),
                              content: const Text(
                                'Name is empty',
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          );
                        }
                      },
                      text: 'Next',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
