import 'package:get/get.dart';
import 'package:github_api/pages/details/details_controller.dart';


class DetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailsController>(() => DetailsController());
  }
}