import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gm_tutorial/controllers/main_controller.dart';
import 'package:gm_tutorial/pages/discover_page.dart';
import 'package:gm_tutorial/pages/myaccount_page.dart';
import 'package:gm_tutorial/pages/vehicle_page.dart';
import 'package:gm_tutorial/utils/theme_util.dart';
import 'package:gm_tutorial/widgets/bottom_navbar.dart';

class MainPage extends GetView<MainController> {
  const MainPage({super.key});

  _buildCurrentPage() {
    List<Widget> pages = [
      const DiscoverPage(),
      const VehiclePage(),
      const MyAccountPage(),
    ];
    return pages[controller.tabIndex.value];
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: GMTheme.cBandBlack.withOpacity(.8),
        bottomNavigationBar: MyBottomNavBar(
          tabIndex: controller.tabIndex.value,
          onTap: (index) {
            controller.tabIndex.value = index;
          },
        ),
        body: _buildCurrentPage(),
      ),
    );
  }
}
