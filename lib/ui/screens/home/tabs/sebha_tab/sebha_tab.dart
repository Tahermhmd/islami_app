import 'dart:math';

import 'package:flutter/material.dart';
import 'package:islamy/ui/utilits/app_assets.dart';
import 'package:islamy/ui/utilits/app_colors.dart';
import 'package:islamy/ui/utilits/constants.dart';
import 'package:provider/provider.dart';

import '../../../../../providers/settings_provider.dart';

class SebhaTab extends StatefulWidget {
  static const String routeName = "Sebha Tab";

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  int currentIndex = 0;
  double rotateAngle = 0;
  late SettingsProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.005,
                  left: MediaQuery.of(context).size.height * 0,
                  right: MediaQuery.of(context).size.width * 0,
                  child: Center(
                    child: provider.isDarkMode()
                        ? Image.asset(AppAssets.sebhaHeadDark)
                        : Image.asset(AppAssets.sebhaHead),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.width * 0.20),
                  child: Transform.rotate(
                      angle: rotateAngle * (pi / 180),
                      child: provider.isDarkMode()
                          ? Image.asset(AppAssets.bodySebhaDark)
                          : Image.asset(AppAssets.bodySebha)),
                ),
              ],
            ),
            Text(
              "عدد التسبيحات",
              style: Theme.of(context).textTheme.displayMedium,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Column(
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      handleFloatingActionButton();
                      rotateImage();
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    //backgroundColor: Theme.of(context).floatingActionButtonTheme as Color,
                    child: Text(
                      "$counter",
                      style:
                      TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 18),
                    padding: EdgeInsets.all(16),
                    child: Text(
                      Constants.AzkarNames[currentIndex],
                      style: TextStyle(color: AppColors.white),
                    ),
                    decoration: BoxDecoration(
                      color: provider.isDarkMode()
                          ? AppColors.accentDark
                          : AppColors.primary,
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void handleFloatingActionButton() {
    setState(() {
      counter++;
      if (counter > 33) {
        counter = 0;
        currentIndex = (currentIndex + 1) % Constants.AzkarNames.length;
      }
    });
  }

  void rotateImage() {
    rotateAngle += 45;
    setState(() {});
  }
}
