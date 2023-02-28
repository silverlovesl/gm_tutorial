import 'package:get/instance_manager.dart';
import 'package:gm_tutorial/controllers/vehicle_controller.dart';

class VehicleBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(VehicleController(repository: Get.find(), settings: Get.find()));
  }
}
