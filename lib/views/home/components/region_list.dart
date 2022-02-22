import 'package:countries/views/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/styles/app_colors.dart';
import '../screens/country_by_region.dart';

class RegionList extends StatelessWidget {
  RegionList({Key? key}) : super(key: key);
  final HomeController homeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            AppConstans.allRegions,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 15,
            ),
            child: Wrap(
              runSpacing: 8,
              children: List.generate(
                homeController.regionList.length,
                (i) {
                  return InkWell(
                    onTap: () => Get.to(
                      () => CountryByRegion(
                        regionName: homeController.regionList[i],
                      ),
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 15,
                      ),
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.grey.withOpacity(0.15),
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: const Offset(0, 1),
                          )
                        ],
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        homeController.regionList[i],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
