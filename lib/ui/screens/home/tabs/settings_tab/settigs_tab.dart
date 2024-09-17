import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamy/providers/settings_provider.dart';
import 'package:islamy/ui/utilits/app_colors.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatefulWidget {
  static const String routeName = "Settings Tab";

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  bool arSwitch = false;
  bool darkModeSwitch = false;
  late SettingsProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    return Column(
      children: [
        Text(
          AppLocalizations.of(context)!.settings,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        buildSettingsRow("العربية", arSwitch, (newValue) {
          arSwitch = newValue;
          if (arSwitch) {
            provider.setCurrentLocale("ar");
          } else {
            provider.setCurrentLocale("en");
          }
        }),
        buildSettingsRow(AppLocalizations.of(context)!.darkMode, darkModeSwitch,
            (newValue) {
              darkModeSwitch = newValue;
          if (darkModeSwitch) {
            provider.setCurrentTheme(ThemeMode.dark);
          } else {
            provider.setCurrentTheme(ThemeMode.light);
          }
        }),
      ],
    );
  }

  Widget buildSettingsRow(
      String title, bool switchValue, Function(bool) onChanged) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          Spacer(),
          Switch(
            value: switchValue,
            onChanged: onChanged,
            activeColor: AppColors.primary,
          )
        ],
      ),
    );
  }
}
