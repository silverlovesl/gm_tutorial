import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:gm_tutorial/bindings/vehicle_binding.dart';
import 'package:gm_tutorial/controllers/main_controller.dart';
import 'package:gm_tutorial/pages/app_routes.dart';
import 'package:gm_tutorial/pages/discover_page.dart';
import 'package:gm_tutorial/pages/main_page.dart';
import 'package:gm_tutorial/pages/myaccount_page.dart';
import 'package:gm_tutorial/pages/register_page.dart';
import 'package:gm_tutorial/pages/vehicle_page.dart';
import 'package:gm_tutorial/repositories/rest_api_repository.dart';
import 'package:gm_tutorial/settings/settings.dart';
import 'package:gm_tutorial/settings/shared_preference_settings.dart';
import 'package:gm_tutorial/utils/theme_util.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Initial all settings and controllers
    Get.put<Settings>(SharedPreferenceSettings());
    Get.put<RestApiRepository>(RestApiRepository(settings: Get.find()));
    Get.put<MainController>(MainController(repository: Get.find(), settings: Get.find()));

    // Set app support orientations (not required)
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: GMTheme.cBandWhite,
    ));

    const localeCN = Locale("zh", "CN");
    const localeUS = Locale("en", "US");
    const defaultLocale = localeCN;

    return FutureBuilder(
      builder: (context, AsyncSnapshot<String> snapshot) {
        return GetMaterialApp(
          title: 'GM Tutorial',
          theme: ThemeData(fontFamily: Platform.isIOS ? GMTheme.fmPFSC : GMTheme.fmNSSC),
          initialRoute: AppRoutes.main,
          locale: defaultLocale,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            localeCN,
            localeUS,
          ],
          getPages: [
            // Every page should be lazy loaded
            GetPage(name: AppRoutes.main, page: () => const MainPage(), bindings: [VehicleBindings()]),
            GetPage(name: AppRoutes.discover, page: () => const DiscoverPage()),
            GetPage(name: AppRoutes.vehicle, page: () => const VehiclePage()),
            GetPage(name: AppRoutes.my_account, page: () => const MyAccountPage()),
            GetPage(name: AppRoutes.register, page: () => const RegisterPage()),
          ],
          home: const MainPage(),
        );
      },
    );
  }
}
