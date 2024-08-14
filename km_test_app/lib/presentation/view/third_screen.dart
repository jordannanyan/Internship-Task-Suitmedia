import 'package:flutter/material.dart';
import 'package:km_test_app/core/constant/textstyle.dart';
import 'package:km_test_app/presentation/viewmodel/user_viewmodel.dart';
import 'package:km_test_app/presentation/widgets/appbar_widget.dart';
import 'package:provider/provider.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarWidget(
        title: 'Third Screen',
      ),
      body: Consumer<UserViewModel>(
        builder: (context, userViewModel, child) {
          return userViewModel.isLoading && userViewModel.users.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : RefreshIndicator(
                  onRefresh: () => userViewModel.refreshUsers(),
                  child: ListView.builder(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      right: 20.0,
                      top: 16,
                      bottom: 16,
                    ),
                    itemCount: userViewModel.users.length +
                        (userViewModel.hasMoreData ? 1 : 0),
                    itemBuilder: (
                      context,
                      index,
                    ) {
                      if (index == userViewModel.users.length) {
                        WidgetsBinding.instance.addPostFrameCallback(
                          (_) {
                            userViewModel.loadUsers();
                          },
                        );
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      final user = userViewModel.users[index];
                      return ListTile(
                        leading: CircleAvatar(
                          radius: 26,
                          backgroundImage: NetworkImage(
                            user.avatar ?? '',
                          ),
                          child: user.avatar == null || user.avatar!.isEmpty
                              ? const Icon(Icons.person)
                              : null,
                        ),
                        title: Text(
                          '${user.firstName} ${user.lastName}',
                          style: CustomStyle().h3Text,
                        ),
                        subtitle: Text(
                          user.email ?? '',
                          style: CustomStyle().secondaryText,
                        ),
                        onTap: () {
                          userViewModel.selectUser(
                            user,
                          );
                          Navigator.pop(
                            context,
                          );
                        },
                      );
                    },
                  ),
                );
        },
      ),
    );
  }
}
