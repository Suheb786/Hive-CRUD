import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveController extends GetxController {
  void intializeHive() async {
    await Hive.initFlutter();
    var box = await Hive.openBox('ContactBox');
  }
}
