import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gm_tutorial/utils/theme_util.dart';

class RegisterPage extends GetView {
  const RegisterPage({super.key});

  Future<bool> _willPopCallback() async {
    // Prevent iOS swipe back
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _willPopCallback,
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(gradient: GMTheme.cRegisterPageBackground),
          width: Get.height,
          height: Get.height,
        ),
      ),
    );
  }
}
