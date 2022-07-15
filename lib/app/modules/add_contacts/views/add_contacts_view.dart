import 'package:contancts/app/data/constants/colors.dart';
import 'package:contancts/app/data/widgets/customTextFormField.dart';
import 'package:contancts/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/add_contacts_controller.dart';

class AddContactsView extends GetView<AddContactsController> {
  const AddContactsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: DARK_GREEN,
        body: Form(
          key: controller.contact_form_key,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Expanded(
                  // flex: 10,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: LIGHT_GREEN),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          CustomTextField(
                            controller: controller.nameCtrl,
                            validator: (p0) => controller.validName(p0),
                            hintText: "Name",
                            fillColor: DARK_GREEN,
                          ),
                          CustomTextField(
                            controller: controller.mobileNOCtrl,
                            validator: (p0) => controller.validMobileNo(p0),
                            hintText: "Mobile No.",
                            fillColor: DARK_GREEN,
                          ),
                          CustomTextField(
                            controller: controller.emailCtrl,
                            validator: (p0) => controller.validEmail(p0),
                            hintText: "Email",
                            fillColor: DARK_GREEN,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Get.offAllNamed(Routes.HOME);
                        },
                        child: Container(
                          width: Get.size.width,
                          height: 70,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: LIGHT_GREEN),
                          child: Center(
                            child: Text("CANCLE",
                                style: GoogleFonts.montserrat(
                                    fontSize: 18,
                                    color: GREEN_TEXT,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          controller.check_and_Save();
                        },
                        child: Container(
                          width: Get.size.width,
                          height: 70,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: DARK_BLUE),
                          child: Center(
                            child: Text("SAVE",
                                style: GoogleFonts.montserrat(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
