import 'package:flutter/material.dart';
import 'package:islamy/providers/settings_provider.dart';
import 'package:islamy/ui/utilits/app_assets.dart';
import 'package:provider/provider.dart';

import '../../../../utilits/app_colors.dart';

late SettingsProvider provider;

class RadioTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AppAssets.radioImageLogo),
        Column(
          children: [
            Text(
              "إذاعة القرآن الكريم",
              style: Theme.of(context).textTheme.displayMedium,
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.skip_previous_rounded,
                      size: 45,
                    ),
                    color: provider.isDarkMode()
                        ? AppColors.accentDark
                        : AppColors.primary,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.play_arrow_rounded,
                      size: 45,
                    ),
                    color: provider.isDarkMode()
                        ? AppColors.accentDark
                        : AppColors.primary,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.skip_next_rounded,
                      size: 45,
                    ),
                    color: provider.isDarkMode()
                        ? AppColors.accentDark
                        : AppColors.primary,
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
