import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vkin/view/salesview.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;

  Future<void> loginUser(String username, String password) async {
    try {
      isLoading(true);

      final response = await GetConnect().post(
        'https://api.accounts.vikncodes.com/api/v1/users/login',
        {
          "username": username,
          "password": password,
          "is_mobile": true,
        },
      );

      if (response.statusCode == 200) {
        var responseData = response.body['data'];
        print(responseData);
        // store in token to shared prefernces
        await savetheToken(responseData['access']);
        // store the user  into local storage
        await saveUser(responseData['user_id']);

        Get.to(SalesPage());
      } else {
        var errorMessage = response.body['message'];
        Get.snackbar('Error', errorMessage);
      }
    } finally {
      isLoading(false);
    }
  }

  Future<void> savetheToken(String entryToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('access_token', entryToken);
    print(entryToken);
  }

  Future<void> saveUser(int userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('user_id', userId);
  }
}
