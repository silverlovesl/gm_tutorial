import 'package:flutter/material.dart';
import 'package:gm_tutorial/utils/asset_util.dart';
import 'package:gm_tutorial/utils/theme_util.dart';

@immutable
class MyBottomNavBar extends StatelessWidget {
  /// Tab index
  final int tabIndex;

  /// On tab click
  final Function(int)? onTap;

  const MyBottomNavBar({Key? key, required this.tabIndex, this.onTap}) : super(key: key);

  BottomNavigationBarItem _buildBottomNavigationBarItem(
    String name,
    String iconPath, {
    double? iconSize,
    bool active = false,
  }) {
    final Color activeColor = active ? GMTheme.cFunctionalHighlight : GMTheme.cFillTertiary;
    final tsLabel = TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: activeColor, height: 10 / 10);

    final item = Container(
      padding: const EdgeInsets.only(top: 16, bottom: 21),
      child: Column(
        children: [
          ImageIcon(AssetImage(iconPath), size: iconSize, color: activeColor),
          const SizedBox(height: 6),
          Text(name, style: tsLabel),
        ],
      ),
    );

    return BottomNavigationBarItem(icon: item, label: "");
  }

  List<BottomNavigationBarItem> _buildBottomNavigationBarItems() {
    return [
      _buildBottomNavigationBarItem("探 索", GMAsset.navHome, active: tabIndex == 0),
      _buildBottomNavigationBarItem("车 辆", GMAsset.navCar, active: tabIndex == 1),
      _buildBottomNavigationBarItem("我 的", GMAsset.navUser, active: tabIndex == 2),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        splashFactory: NoSplash.splashFactory,
        highlightColor: Colors.transparent,
      ),
      child: MediaQuery.removePadding(
        context: context,
        removeBottom: true,
        child: Container(
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(
                width: 1,
                color: GMTheme.cMonchromeBlackGrey,
              ),
            ),
          ),
          child: BottomNavigationBar(
            backgroundColor: GMTheme.cNavBarBackground,
            type: BottomNavigationBarType.fixed,
            currentIndex: tabIndex,
            onTap: onTap,
            items: _buildBottomNavigationBarItems(),
          ),
        ),
      ),
    );
  }
}
