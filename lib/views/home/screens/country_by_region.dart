import 'package:countries/core/constants/app_constants.dart';
import 'package:countries/views/home/components/country_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_text_styles.dart';
import '../controllers/home_controller.dart';
import '../models/country_model.dart';

class CountryByRegion extends StatelessWidget {
  CountryByRegion({
    Key? key,
    required this.regionName,
  }) : super(key: key);
  final String regionName;
  final HomeController homeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        title: Text(
          AppConstans.appName + ' in $regionName',
          style: AppTextStyles.work25Black,
        ),
        centerTitle: true,
        leading: IconButton(
          color: AppColors.black,
          icon: const Icon(
            Icons.arrow_back_ios_new,
          ),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              Container(
                width: double.infinity,
                height: 48,
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 15,
                        offset: const Offset(0, 1),
                      )
                    ]),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 5,
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.search,
                          color: AppColors.black,
                        )),
                    const SizedBox(
                      width: 5,
                    ),
                    Flexible(
                      child: TextField(
                        cursorColor: AppColors.black,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search for countries in $regionName",
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Column(
                children:
                    List.generate(homeController.allCountries.length, (index) {
                  Countries country = homeController.allCountries[index];
                  if (country.region == regionName) {
                    return CountryCard(country: country);
                  } else {
                    return const SizedBox.shrink();
                  }
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
