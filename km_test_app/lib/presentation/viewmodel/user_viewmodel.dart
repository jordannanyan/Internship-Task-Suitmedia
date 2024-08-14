import 'package:flutter/material.dart';
import 'package:km_test_app/data/models/user_model.dart';
import 'package:km_test_app/data/repositories/user_repository.dart';

class UserViewModel extends ChangeNotifier {
  final UserRepository userRepository;
  List<Datum> users = [];
  bool isLoading = false;
  bool hasMoreData = true;
  int currentPage = 1;

  String? selectedUserName;

  // Inisialisasi UserViewModel dengan userRepository
  UserViewModel({required this.userRepository});

  // Memuat data pengguna dari API
  Future<void> loadUsers() async {
    if (isLoading || !hasMoreData) return;

    isLoading = true;
    notifyListeners();

    try {
      final User user = await userRepository.fetchUsers(page: currentPage);
      if (user.data!.isEmpty) {
        hasMoreData = false; // Tidak ada lagi data untuk diambil
      } else {
        users.addAll(user.data!); // Menambah data pengguna ke dalam list
        currentPage++;
      }
    } catch (e) {
      hasMoreData = false;
    }

    isLoading = false;
    notifyListeners();
  }

  // Memuat ulang data pengguna (refresh)
  Future<void> refreshUsers() async {
    currentPage = 1;
    users.clear();
    hasMoreData = true;
    await loadUsers();
  }

  // Memilih pengguna
  void selectUser(Datum user) {
    selectedUserName = '${user.firstName} ${user.lastName}';
    notifyListeners();
  }
}
