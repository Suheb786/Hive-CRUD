import 'package:contancts/app/modules/add_contacts/controllers/add_contacts_controller.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    Get.put(AddContactsController);
    final show = Get.find<AddContactsController>().contactBox.get("mohammad");
    print(show);
    super.onInit();
  }
}
