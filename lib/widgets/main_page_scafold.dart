import 'package:flutter/material.dart';

import '../utils/theme_util.dart';

@immutable
class MainPageFrame extends StatelessWidget {
  /// Child component
  final List<Widget>? children;
  const MainPageFrame({
    super.key,
    this.children = const [],
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GMTheme.cMainPageBackground,
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            ...children ?? [],
          ],
        )),
      ),
    );
  }
}
