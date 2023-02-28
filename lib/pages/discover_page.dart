import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gm_tutorial/controllers/discover_controller.dart';
import 'package:gm_tutorial/utils/asset_util.dart';
import 'package:gm_tutorial/utils/theme_util.dart';
import 'package:gm_tutorial/widgets/main_page_scafold.dart';

class DiscoverPage extends GetView<DiscoverController> {
  const DiscoverPage({super.key});

  _buildTopMenu() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Hi, 新朋友", style: GMTheme.tsDiscoverLabel),
          const ImageIcon(AssetImage(GMAsset.scan), color: GMTheme.cTextSecondary),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MainPageFrame(
      children: [
        _buildTopMenu(),
      ],
    );
  }
}
