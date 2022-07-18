import 'package:contancts/app/modules/add_contacts/controllers/add_contacts_controller.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class HomeController extends GetxController {
  late Box contactBox;
  final addContactsController = Get.find<AddContactsController>();
  @override
  void onInit() {
    Get.put(AddContactsController);
    contactBox = Hive.box("ContactBox");
    // final show = Get.find<AddContactsController>().contactBox.get("mohammad");
    // print(show);
    super.onInit();
  }

  void findBox() {}
}
