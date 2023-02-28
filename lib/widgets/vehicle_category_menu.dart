import 'package:flutter/material.dart';
import 'package:gm_tutorial/models/vehicle_category_menu_item.dart';
import 'package:gm_tutorial/utils/theme_util.dart';

@immutable
class VehicleCategoryMenu extends StatelessWidget {
  final ScrollController _scrollCtrl = ScrollController();
  final int selectedId;
  final List<VehicleCategoryMenuItem> menuItems;
  final Function(int id)? onMenuSelect;
  VehicleCategoryMenu({
    super.key,
    this.selectedId = -1,
    this.menuItems = const [],
    this.onMenuSelect,
  });

  _buildListItem(VehicleCategoryMenuItem menuItem) {
    // Current menu is selected
    final isActive = menuItem.id == selectedId;

    return GestureDetector(
      onTap: () {
        onMenuSelect?.call(menuItem.id);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: isActive ? GMTheme.cAccentSuperBlue : Colors.transparent, width: 2.5),
          ),
        ),
        child: Text(
          menuItem.label,
          style: TextStyle(
            color: isActive ? GMTheme.cFillPrimary : GMTheme.cTextSecondary,
            fontSize: 18,
            fontWeight: FontWeight.w500,
            height: 24 / 18,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      width: double.infinity,
      height: 40,
      child: ListView.separated(
          controller: _scrollCtrl,
          itemCount: menuItems.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final currentItem = menuItems[index];
            return _buildListItem(currentItem);
          },
          separatorBuilder: (context, index) => const SizedBox(width: 40)),
    );
  }
}
