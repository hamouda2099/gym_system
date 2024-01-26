import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gym_system/logic/ui_logic/create_coach_logic.dart';

import '../../config/constants.dart';
import '../components/custom_text_field.dart';
import '../components/side_menu.dart';

class CraeteCoach extends StatelessWidget {
  CreateCoachLogic logic = CreateCoachLogic();
  @override
  Widget build(BuildContext context) {
    logic.context = context;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Row(
        children: [
          const SideMenu(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Row(
                          children: [
                            const Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Create Coach".tr(),
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: screenWidth / 3,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: logic.nameCnt,
                          hint: "Name".tr(),
                          width: screenWidth / 4,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          controller: logic.phoneCnt,
                          hint: "Phone".tr(),
                          width: screenWidth / 4,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          controller: logic.passCnt,
                          hint: "Password".tr(),
                          width: screenWidth / 4,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          controller: logic.salaryCnt,
                          hint: "Salary".tr(),
                          width: screenWidth / 4,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          controller: logic.hoursCnt,
                          hint: "Hours".tr(),
                          width: screenWidth / 4,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            logic.create();
                          },
                          child: Container(
                            width: screenWidth / 4,
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
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
