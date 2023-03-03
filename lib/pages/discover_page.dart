import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gm_tutorial/controllers/discover_controller.dart';
import 'package:gm_tutorial/utils/asset_util.dart';
import 'package:gm_tutorial/utils/theme_util.dart';
import 'package:gm_tutorial/widgets/main_page_scafold.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

  _buildI18nTest() {
    final i18n = AppLocalizations.of(Get.context!)!;
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(i18n.helloWorld, style: GMTheme.tsDiscoverLabel),
          Text(i18n.since("2023"), style: GMTheme.tsDiscoverLabel),
          Text(i18n.newFriend, style: GMTheme.tsDiscoverLabel),
          ElevatedButton(
              onPressed: () {},
              child: Text(
                "Change Language",
                style: GMTheme.tsDiscoverLabel,
              ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MainPageFrame(
      children: [
        _buildTopMenu(),
        _buildI18nTest(),
      ],
    );
  }
}
