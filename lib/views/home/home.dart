import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/widgets/common_empty_error.dart';
import '../../core/widgets/common_loading_indicator.dart';
import 'controllers/home_controller.dart';

class Homepage extends StatelessWidget {
  Homepage({Key? key}) : super(key: key);
  final HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() {
          if (controller.countryLoading.isTrue) {
            return const CommonLoadingIndicator();
          } else if (controller.regionList.isEmpty) {
            return const CommonEmptyError();
          } else {
            return Text('${controller.allCountries.length}');
          }
        }),
      ),
    );
  }
}
