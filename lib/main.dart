import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:gm_tutorial/controllers/main_controller.dart';
import 'package:gm_tutorial/pages/app_routes.dart';
import 'package:gm_tutorial/pages/discover_page.dart';
import 'package:gm_tutorial/pages/main_page.dart';
import 'package:gm_tutorial/pages/profile_page.dart';
import 'package:gm_tutorial/pages/register_page.dart';
import 'package:gm_tutorial/pages/vehicle_page.dart';
import 'package:gm_tutorial/repositories/rest_api_repository.dart';
import 'package:gm_tutorial/settings/settings.dart';
import 'package:gm_tutorial/settings/shared_preference_settings.dart';
import 'package:gm_tutorial/utils/theme_util.dart';

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

    return FutureBuilder(
      builder: (context, AsyncSnapshot<String> snapshot) {
        return GetMaterialApp(
          title: 'GM Tutorial',
          theme: ThemeData(fontFamily: Platform.isIOS ? GMTheme.fmPFSC : GMTheme.fmNSSC),
          initialRoute: AppRoutes.main,
          getPages: [
            // Every page should be lazy loaded
            GetPage(name: AppRoutes.main, page: () => const MainPage()),
            GetPage(name: AppRoutes.discover, page: () => const DiscoverPage()),
            GetPage(name: AppRoutes.vehicle, page: () => const VehiclePage()),
            GetPage(name: AppRoutes.profile, page: () => const ProfilePage()),
            GetPage(name: AppRoutes.register, page: () => const RegisterPage()),
          ],
          home: const MainPage(),
        );
      },
    );
  }
}
