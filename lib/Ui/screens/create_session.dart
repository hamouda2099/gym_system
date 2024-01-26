import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gym_system/config/constants.dart';
import 'package:gym_system/dialogs/basic_dialogs.dart';
import 'package:gym_system/logic/services/api_manger.dart';

import '../components/custom_text_field.dart';

void createSession(BuildContext context) {
  TextEditingController nameCnt = TextEditingController();
  TextEditingController costCnt = TextEditingController();
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Create Session".tr(),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.close,
                  color: Colors.red,
                ),
              )
            ],
          ),
          content: SizedBox(
            width: screenWidth / 4,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomTextField(
                  controller: nameCnt,
                  hint: "Name".tr(),
                  width: screenWidth / 5,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  controller: costCnt,
                  hint: "Cost".tr(),
                  width: screenWidth / 5,
                  icon: const Text(
                    ".LE",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    if (nameCnt.text.isEmpty || costCnt.text.isEmpty) {
                      Dialogs().messageDialog(context, "fields required".tr());
                    } else {
                      Dialogs().loadingDialog(context);
                      ApiManger.createSession(
                              name: nameCnt.text, cost: num.parse(costCnt.text))
                          .then((value) {
                        Navigator.pop(context);
                        if (value['statusCode'] == 200) {
                          Navigator.pop(context);
                        } else {
                          Dialogs()
                              .messageDialog(context, value['message'] ?? '');
                        }
                      });
                    }
                  },
                  child: Container(
                    width: screenWidth / 5,
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      "Create".tr(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      });
}
