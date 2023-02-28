import 'package:get/get.dart';
import 'package:gm_tutorial/repositories/rest_api_repository.dart';
import 'package:gm_tutorial/settings/settings.dart';

class VehicleController extends GetxController {
  final selectedCategoryId = (-1).obs;
  final RestApiRepository repository;
  final Settings settings;

  VehicleController({required this.repository, required this.settings});
}
