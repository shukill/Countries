import 'package:countries/core/styles/app_text_styles.dart';
import 'package:countries/core/utilities.dart';
import '../../core/constants/app_constants.dart';
import '../../core/styles/app_colors.dart';
import 'components/all_countries_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/widgets/common_empty_error.dart';
import '../../core/widgets/common_loading_indicator.dart';
import 'components/region_list.dart';
import 'controllers/home_controller.dart';

class Homepage extends StatelessWidget {
  Homepage({Key? key}) : super(key: key);
  final HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => AppUtilities().onWillPop(context),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.backgroundColor,
          elevation: 0,
          title: Text(
            AppConstans.appName,
            style: AppTextStyles.work25Black,
          ),
          centerTitle: true,
          leading: IconButton(
            color: AppColors.black,
            icon: const Icon(
              Icons.menu_rounded,
            ),
            onPressed: () => AppUtilities().onWillPop(context),
          ),
        ),
        body: Obx(() {
          if (controller.countryLoading.isTrue) {
            return const CommonLoadingIndicator();
          } else if (controller.regionList.isEmpty) {
            return const CommonEmptyError();
          } else {
            return SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RegionList(),
                    AllCountriesList(),
                  ],
                ),
              ),
            );
          }
        }),
      ),
    );
  }
}
