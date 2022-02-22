import 'package:countries/core/styles/app_colors.dart';
import 'package:countries/views/home/models/country_model.dart';
import 'package:countries/views/home/screens/country_detail_page.dart';
import 'package:flutter/material.dart';

class CountryCard extends StatelessWidget {
  const CountryCard({
    Key? key,
    required this.country,
  }) : super(key: key);

  final Countries country;

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: ValueKey(country),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((context) => CountryDetailScreen(country: country)),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: AppColors.grey.withOpacity(0.15),
                  spreadRadius: 2,
                  blurRadius: 15,
                  offset: const Offset(0, 1),
                )
              ],
              color: AppColors.white.withOpacity(0.6),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                Container(
                  width: 65,
                  height: 65,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    border: Border.all(color: AppColors.black),
                  ),
                  child: Center(
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                          image: NetworkImage(country.flags!.png!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        country.name!.official!,
                        style: const TextStyle(
                          fontSize: 15,
                          color: AppColors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        country.capital!.isNotEmpty
                            ? country.capital!.first
                            : '',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.black.withOpacity(0.5),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
