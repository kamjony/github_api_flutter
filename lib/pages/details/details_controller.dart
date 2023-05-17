import 'package:get/get.dart';
import 'package:github_api/models/github_response_model.dart';
import 'package:intl/intl.dart';

class DetailsController extends GetxController{

  Item item = Item();

  @override
  void onInit() {

    if (Get.arguments != null) {
      item = Get.arguments;
      print(item.fullName);
    }
    super.onInit();
  }

  String? formatDate(String dateTime) {
    var dt = DateTime.parse(dateTime);
    String d = DateFormat("MM-dd-yy HH:mm:ss").format(dt);
    return d;
  }
}