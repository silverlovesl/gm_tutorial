import 'package:get/get.dart';
import 'package:gm_tutorial/repositories/rest_api_repository.dart';
import 'package:gm_tutorial/settings/settings.dart';

class MainController extends GetxController {
  /// Selected tab index
  final tabIndex = 0.obs;
  final RestApiRepository repository;
  final Settings settings;

  MainController({required this.repository, required this.settings});
}
