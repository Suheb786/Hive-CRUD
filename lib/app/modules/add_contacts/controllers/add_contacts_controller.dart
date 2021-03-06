import 'dart:developer';

import 'package:contancts/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class AddContactsController extends GetxController {
  late Box contactBox; 

  TextEditingController nameCtrl = TextEditingController();
  TextEditingController mobileNOCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();

  final contact_form_key = GlobalKey<FormState>();

  late final key = nameCtrl.text;
  late final value = mobileNOCtrl.text;

  @override
  void onInit() {
    contactBox = Hive.box("ContactBox");
    super.onInit();
  }

//* validation -------------->>>>>>>>>

  String? validName(String? name) {
    if (name!.length < 5) {
      return "Enter a Name";
    }
  }

  String? validMobileNo(String? mobileNo) {
    if (mobileNo!.length < 10) {
      return "Enter a Mobile NO";
    }
  }

  String? validEmail(String? email) {
    if (!GetUtils.isEmail(email!)) {
      return "Enter a Email";
    }
  }

  void check_and_Save() {
    if (contact_form_key.currentState!.validate()) {
      contactBox.put(key, value);
      Get.offAllNamed(Routes.HOME);

      final output = contactBox.get(key);
      log("the values are: ${output} ");
    }
  }

  @override
  void dispose() {
    nameCtrl;
    mobileNOCtrl;
    emailCtrl;
    super.dispose();
  }
}
