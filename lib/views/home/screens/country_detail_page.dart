import 'package:cached_network_image/cached_network_image.dart';
import 'package:countries/core/styles/app_text_styles.dart';
import 'package:countries/views/home/components/country_card.dart';
import 'package:countries/views/home/controllers/home_controller.dart';
import 'package:countries/views/home/models/country_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/styles/app_colors.dart';

const kBlackColor = Color(0xFF393939);
const kLightBlackColor = Color(0xFF8F8F8F);

class CountryDetailScreen extends StatelessWidget {
  CountryDetailScreen({
    Key? key,
    required this.country,
  }) : super(key: key);
  final Countries country;
  final HomeController homeController = Get.find();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(
                top: size.height * .12,
                left: size.width * .1,
                right: size.width * .02,
              ),
              height: size.height * .48,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: CachedNetworkImageProvider(country.flags!.png!),
                  fit: BoxFit.cover,
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 8,
              ),
              child: Text(
                country.name!.official!,
                style: AppTextStyles.work25Black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 8,
              ),
              child: Text(
                '${country.name!.official}\'s common borders',
                style: AppTextStyles.work18Pink,
              ),
            ),
            SharedBorderList(
              size: size,
              country: country,
              homeController: homeController,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 8,
              ),
              child: Text(
                '${country.name!.official}\'s language',
                style: AppTextStyles.work18Pink,
              ),
            ),
            (country.languages != null)
                ? Padding(
                    padding: const EdgeInsets.all(
                      15,
                    ),
                    child: Wrap(
                      runSpacing: 8,
                      children: List.generate(
                        country.languages!.values.length,
                        (i) {
                          return Container(
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
                              country.languages!.values.elementAt(i),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                : const Text('No Offical Data found :('),
            const SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }
}

class SharedBorderList extends StatelessWidget {
  const SharedBorderList({
    Key? key,
    required this.size,
    required this.country,
    required this.homeController,
  }) : super(key: key);

  final Size size;
  final Countries country;
  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          country.borders!.length,
          (i) {
            Countries? myCountry = homeController.allCountries.firstWhere(
              (element) {
                Countries item = element;
                return item.cca3 == country.borders![i];
              },
              orElse: () => null,
            );
            if (myCountry != null) {
              return CountryCard(
                country: myCountry,
                key: ValueKey(myCountry),
              );
            } else {
              return BorderCard(
                name: country.borders![i],
                press: () {},
                captial: '',
              );
            }
          },
        ),
      ),
    );
  }
}

class BorderCard extends StatelessWidget {
  final String name;
  final String captial;
  final Function() press;
  const BorderCard({
    Key? key,
    required this.name,
    required this.press,
    required this.captial,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      margin: const EdgeInsets.only(bottom: 16),
      width: size.width - 48,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(38.5),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 10),
            blurRadius: 33,
            color: const Color(0xFFD3D3D3).withOpacity(.84),
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "$name \n",
                  style: const TextStyle(
                    fontSize: 16,
                    color: kBlackColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: captial,
                  style: const TextStyle(color: kLightBlackColor),
                ),
              ],
            ),
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(
              Icons.arrow_forward_ios,
              size: 18,
            ),
            onPressed: press,
          )
        ],
      ),
    );
  }
}
