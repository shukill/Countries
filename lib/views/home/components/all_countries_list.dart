import 'package:countries/core/constants/app_constants.dart';
import 'package:countries/views/home/components/country_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/styles/app_colors.dart';
import '../controllers/home_controller.dart';
import '../models/country_model.dart';

class AllCountriesList extends StatelessWidget {
  AllCountriesList({
    Key? key,
  }) : super(key: key);
  final HomeController homeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            AppConstans.allCountries,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
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
                const Flexible(
                  child: TextField(
                    cursorColor: AppColors.black,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search for countries",
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
              return CountryCard(country: country);
            }),
          )
        ],
      ),
    );
  }
}
