import 'package:contancts/app/data/constants/colors.dart';
import 'package:contancts/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: DARK_GREEN,
        // appBar: AppBar(
        //   title: Text('HomeView'),
        //   centerTitle: true,
        // ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Expanded(
                // flex: 10,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: LIGHT_GREEN),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(Routes.ADD_CONTACTS);
                },
                child: Container(
                    width: Get.size.width,
                    height: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: LIGHT_GREEN),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Icon(
                          Icons.edit,
                          color: GREEN_TEXT,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text("ADD NEW CONTACT",
                            style: GoogleFonts.montserrat(
                                fontSize: 18,
                                color: GREEN_TEXT,
                                fontWeight: FontWeight.bold)),
                      ],
                    )),
              ),
            ],
          ),
        ));
  }
}
