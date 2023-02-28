import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gm_tutorial/pages/app_routes.dart';
import 'package:gm_tutorial/utils/theme_util.dart';

class DiscoverPage extends GetView {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GMTheme.cMainPageBackground,
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Get.toNamed(AppRoutes.register);
            },
            child: const Text("Go")),
      ),
    );
  }
}
