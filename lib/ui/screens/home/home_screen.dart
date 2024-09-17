import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamy/providers/settings_provider.dart';
import 'package:islamy/ui/screens/home/tabs/ahadeth_tab/ahadeth_tab.dart';
import 'package:islamy/ui/screens/home/tabs/quran_tab/quran_tab.dart';
import 'package:islamy/ui/screens/home/tabs/radio_tab/radio_tab.dart';
import 'package:islamy/ui/screens/home/tabs/sebha_tab/sebha_tab.dart';
import 'package:islamy/ui/screens/home/tabs/settings_tab/settigs_tab.dart';
import 'package:islamy/ui/utilits/app_assets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "Home Screen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentTabIndex = 0;
  List<Widget> tabs = [
    RadioTab(),
    SebhaTab(),
    AhadethTab(),
    QuranTab(),
    SettingsTab()
  ];

  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of(context);

    return Stack(
      children: [
        if (provider.isDarkMode())
          Image.asset(
            AppAssets.darkBackground,
            fit: BoxFit.fill,
            width: double.infinity,
          )
        else
          Image.asset(
            AppAssets.background,
            fit: BoxFit.fill,
            width: double.infinity,
          ),
        Scaffold(
          //backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              AppLocalizations.of(context)!.islamy,
            ),
          ),
          bottomNavigationBar: buildBottomNavigationBar(),
          body: tabs[currentTabIndex],
        ),
      ],
    );
  }

  Widget buildBottomNavigationBar() => Theme(
    data: Theme.of(context)
            .copyWith(canvasColor: Theme.of(context).primaryColor),
        child: BottomNavigationBar(
            currentIndex: currentTabIndex,
            onTap: (index) {
              currentTabIndex = index;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage(AppAssets.icRadio),
                    size: 35,
                  ),
                  label: AppLocalizations.of(context)!.radio),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage(AppAssets.icSebha),
                    size: 35,
                  ),
                  label: AppLocalizations.of(context)!.sebha),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage(AppAssets.icHadeth),
                    size: 35,
                  ),
                  label: AppLocalizations.of(context)!.ahadeth),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage(AppAssets.icQuran),
                    size: 35,
                  ),
                  label: AppLocalizations.of(context)!.quran),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings, size: 30),
                  label: AppLocalizations.of(context)!.settings),
            ]),
      );
}
