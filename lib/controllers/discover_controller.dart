import 'package:get/get.dart';
import 'package:gm_tutorial/repositories/rest_api_repository.dart';
import 'package:gm_tutorial/settings/settings.dart';

class DiscoverController extends GetxController {
  final RestApiRepository repository;
  final Settings settings;

  DiscoverController({required this.repository, required this.settings});
}
