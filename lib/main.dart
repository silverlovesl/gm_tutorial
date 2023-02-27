import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:gm_tutorial/pages/app_routes.dart';
import 'package:gm_tutorial/pages/register_page.dart';
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

    // Set app support orientations (not required)
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return FutureBuilder(
      builder: (context, AsyncSnapshot<String> snapshot) {
        return GetMaterialApp(
          title: 'GM Tutorial',
          theme: ThemeData(
            fontFamily: GMTheme.fmPFSC,
            primarySwatch: Colors.blue,
          ),
          initialRoute: AppRoutes.register,
          getPages: [
            // Every page should be lazy loaded
            GetPage(name: AppRoutes.register, page: () => const RegisterPage()),
          ],
          home: const MyHomePage(),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[Text("汉子测试")],
        ),
      ),
    );
  }
}
