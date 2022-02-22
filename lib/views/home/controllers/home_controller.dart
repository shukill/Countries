import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../models/country_model.dart';
import '../services/home_apis.dart';

class HomeController extends GetxController {
  RxList allCountries = [].obs;
  RxList regionList = [].obs;
  // === Loading ===
  RxBool countryLoading = false.obs;

  @override
  void onInit() {
    getAllCountries();
    super.onInit();
  }

  void getAllCountries() async {
    try {
      allCountries.clear();
      countryLoading(true);
      var res = await HomeApis().getCountryList();
      allCountries.value = res;
      getRegions();
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
      rethrow;
    } finally {
      countryLoading(false);
    }
  }

  void getRegions() {
    regionList.clear();
    for (Countries countries in allCountries) {
      if (!regionList.contains(countries.region)) {
        regionList.add(countries.region);
      }
    }
  }
}
