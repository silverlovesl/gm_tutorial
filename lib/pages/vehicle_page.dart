import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gm_tutorial/controllers/vehicle_controller.dart';
import 'package:gm_tutorial/models/vehicle_category_menu_item.dart';
import 'package:gm_tutorial/widgets/main_page_scafold.dart';
import 'package:gm_tutorial/widgets/vehicle_category_menu.dart';

class VehiclePage extends GetView<VehicleController> {
  const VehiclePage({super.key});

  /// Create category menu
  Widget _buildMenu() {
    final List<VehicleCategoryMenuItem> menuItems = [
      VehicleCategoryMenuItem(id: 1, label: "GMC"),
      VehicleCategoryMenuItem(id: 2, label: "BUICK"),
      VehicleCategoryMenuItem(id: 3, label: "CHEVROLET"),
      VehicleCategoryMenuItem(id: 4, label: "CADILLAC"),
    ];
    if (controller.selectedCategoryId.value == -1) {
      controller.selectedCategoryId.value = menuItems.first.id;
    }
    return VehicleCategoryMenu(
        menuItems: menuItems,
        selectedId: controller.selectedCategoryId.value,
        onMenuSelect: (selectedId) {
          controller.selectedCategoryId.value = selectedId;
        });
  }

  @override
  Widget build(BuildContext context) {
    return MainPageFrame(
      children: [
        /// Category Menu
        Obx(() => _buildMenu()),
      ],
    );
  }
}
