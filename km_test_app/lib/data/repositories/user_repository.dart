import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:km_test_app/core/utils/utils.dart';
import 'package:km_test_app/data/models/user_model.dart';

class UserRepository {
  Future<User> fetchUsers({int page = 1, int perPage = 10}) async {
    final response = await http.get(
      Uri.parse(
        '${ApiConstants.usersEndpoint}?page=$page&per_page=$perPage',
      ),
    );

    if (response.statusCode == 200) {
      return User.fromJson(
        json.decode(
          response.body,
        ),
      );
    } else {
      throw Exception(
        'Failed to load users',
      );
    }
  }
}
