

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vkin/MOdel/modelclass.dart';


class SalesController extends GetxController {
  var isLoading = true.obs;
  var salesData = <Sale>[].obs;
  var userId = 0.obs;

  @override
  void onInit() {
    super.onInit();
    getUserId();
    fetchData();
  }

  Future<void> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId.value = prefs.getInt('user_id') ?? 0;
  }
  //create get function
  Future<void> fetchData() async {
    try {
      isLoading(true);

      final response = await GetConnect().post(
        'https://www.api.viknbooks.com/api/v10/sales/sale-list-page/',
        {
          "BranchID": 1,
          "CompanyID": "1901b825-fe6f-418d-b5f0-7223d0040d08",
          "CreatedUserID": userId.value,
          "PriceRounding": 3,
          "page_no": 1,
          "items_per_page": 10,
          "type": "Sales",
          "WarehouseID": 1,
        },
        headers: {
          'Authorization': 'Bearer ${await gettheToken()}',
        },
      );
       //checking condition
      if (response.statusCode == 200) {
        print("API Response: ${response.body}");
        salesData.assignAll(
          (response.body['data'] as List)
              .map((json) => Sale.fromJson(json))
              .toList(),
        );
      } else {
        print("API Error: ${response.statusCode}");
        Get.snackbar('Error', 'Failed to load data');
      }
    } catch (error) {
      print(error);
      Get.snackbar('Error', 'Failed to load data: $error');
    } finally {
      isLoading(false);
    }
  }

  Future<String?> gettheToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('access_token');
  }
}
