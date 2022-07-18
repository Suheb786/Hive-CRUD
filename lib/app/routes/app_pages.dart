import 'package:contancts/app/modules/add_contacts/views/update_contacts_view.dart';
import 'package:get/get.dart';

import '../modules/add_contacts/bindings/add_contacts_binding.dart';
import '../modules/add_contacts/views/add_contacts_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ADD_CONTACTS,
      page: () => const AddContactsView(),
      binding: AddContactsBinding(),
    ),
    GetPage(
      name: _Paths.UPDATE_CONTATC,
      page: () => UpdateContactsView(),
      binding: AddContactsBinding(),
    ),
  ];
}
