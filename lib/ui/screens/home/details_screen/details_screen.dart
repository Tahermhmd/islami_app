import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy/data_model/details_screen_args.dart';
import 'package:islamy/ui/utilits/app_colors.dart';
import 'package:provider/provider.dart';

import '../../../../providers/settings_provider.dart';
import '../../../utilits/app_assets.dart';

class DetailScreen extends StatefulWidget {
  static const String routeName = "Details Screen";

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late DetailsScreenArgs arguments;
  String fileContent = "";
  late SettingsProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    arguments = ModalRoute.of(context)!.settings.arguments as DetailsScreenArgs;
    //print("File Surah Name : ${arguments.detailsScreenContent}");
    if (fileContent.isEmpty) readFile();
    return Stack(children: [
      provider.isDarkMode()
          ? Image.asset(
              AppAssets.darkBackground,
              fit: BoxFit.fill,
              width: double.infinity,
            )
          : Image.asset(
              AppAssets.background,
              fit: BoxFit.fill,
              width: double.infinity,
            ),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(arguments.detailsScreenTitle,
              style: Theme.of(context).textTheme.bodyLarge),
        ),
        body: fileContent.isEmpty
            ? Center(child: CircularProgressIndicator())
            : Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
                    color: provider.isDarkMode()
                        ? AppColors.primaryDark
                        : AppColors.containerBackground,
                  ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                  child: Text(
                    "$fileContent",
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium,
                    )),
            ),
          ),
        ),
      ),
    ]);
  }

  void readFile() async {
    String file = await rootBundle.loadString(arguments.isQuranScreen
        ? "assets/files/quran/${arguments.detailsScreenContent}"
        : "assets/files/hadeth/${arguments.detailsScreenContent}");
    fileContent = file;
    List<String> fileLines = file.split("\n");
    for (int i = 0; i < fileLines.length; i++) {
      fileLines[i] += arguments.isQuranScreen ? "(${i + 1}) " : " ";
    }
    fileContent = fileLines.join();
    setState(() {});
    print("$file");
  }
}
