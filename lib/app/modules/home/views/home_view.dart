import 'package:contancts/app/data/constants/colors.dart';
import 'package:contancts/app/modules/add_contacts/controllers/add_contacts_controller.dart';
import 'package:contancts/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  final contactBox = Get.find<AddContactsController>().contactBox;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: LIGHT_GREEN,
            title: Center(child: Text("Contacts"))),
        backgroundColor: DARK_GREEN,
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Expanded(
                  child: ValueListenableBuilder<Box>(
                      valueListenable: contactBox.listenable(),
                      builder: (context, box, contacts) {
                        return ListView.separated(
                            itemBuilder: ((context, index) {
                              final key = contactBox.keys.toList()[index];
                              final value = contactBox.get(key);
                              return ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: LIGHT_GREEN,
                                  child: Text("${key[0]}"),
                                ),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    InkWell(
                                      onTap: () =>
                                          Get.toNamed(Routes.UPDATE_CONTATC),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: LIGHT_GREEN,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        padding: EdgeInsets.all(10),
                                        child: Icon(
                                          Icons.edit,
                                          color: Colors.white70,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    InkWell(
                                      onTap: () => contactBox.delete(key),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: LIGHT_GREEN,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        padding: EdgeInsets.all(10),
                                        child: Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                title: Text("$key",
                                    style: GoogleFonts.montserrat(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                                subtitle: Text("$value",
                                    style: GoogleFonts.montserrat(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                              );
                            }),
                            separatorBuilder: ((context, index) {
                              return Divider(
                                color: LIGHT_GREEN,
                              );
                            }),
                            itemCount: contactBox.keys.toList().length);
                      })),
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
