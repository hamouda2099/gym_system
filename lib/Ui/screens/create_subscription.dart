import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../config/constants.dart';
import '../../logic/ui_logic/create_subscription_logic.dart';
import '../components/custom_text_field.dart';
import '../components/side_menu.dart';

class CreateSubscription extends StatelessWidget {
  CreateSubscriptionLogic logic = CreateSubscriptionLogic();
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
                            "Create Subscription".tr(),
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
                  width: screenWidth / 1.5,
                  height: screenHeight / 1.2,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTextField(
                            controller: logic.fullNameCnt,
                            hint: "Full Name".tr(),
                            width: screenWidth / 2.35,
                          ),
                          CustomTextField(
                            controller: logic.phoneCnt,
                            hint: "Phone".tr(),
                            width: screenWidth / 5,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTextField(
                            controller: logic.startDateCnt,
                            hint: "Start Date".tr(),
                            width: screenWidth / 5,
                            icon: InkWell(
                              onTap: () {},
                              child: const Icon(
                                Icons.calendar_month,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          CustomTextField(
                            controller: logic.endDateCnt,
                            hint: "End Date".tr(),
                            width: screenWidth / 5,
                            icon: InkWell(
                              onTap: () {},
                              child: const Icon(
                                Icons.calendar_month,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: screenWidth / 5,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomTextField(
                                  controller: logic.priceCnt,
                                  hint: "Price".tr(),
                                  width: screenWidth / 8,
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Row(
                                    children: [
                                      Text(
                                        "Offer".tr(),
                                        style: const TextStyle(
                                            color: Colors.orange),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      const Icon(
                                        Icons.toggle_on,
                                        color: Colors.orange,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTextField(
                            controller: logic.paidCnt,
                            hint: "Paid".tr(),
                            width: screenWidth / 5,
                          ),
                          SizedBox(
                            width: screenWidth / 5,
                            // child: const Row(
                            //   children: [
                            //     Text(
                            //       "Reminder",
                            //       style: TextStyle(color: Colors.grey),
                            //     ),
                            //     SizedBox(
                            //       width: 5,
                            //     ),
                            //     Text(
                            //       " ${()} .LE",
                            //       style: TextStyle(color: Colors.black),
                            //     )
                            //   ],
                            // ),
                          ),
                          Container(
                            width: screenWidth / 5,
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(.1),
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              children: [
                                Text(
                                  "Coach".tr(),
                                  style: const TextStyle(color: Colors.grey),
                                ),
                                const Spacer(),
                                InkWell(
                                    onTap: () {},
                                    child: const Icon(
                                      Icons.search,
                                      color: Colors.black,
                                    ))
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Offer Members".tr(),
                            style: const TextStyle(
                              color: Colors.orange,
                            ),
                          ),
                          InkWell(
                              onTap: () {},
                              child: const Icon(
                                Icons.add_box_outlined,
                                color: Colors.orange,
                              ))
                        ],
                      ),
                      const Divider(
                        color: Colors.orange,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: screenWidth / 1.5,
                        height: screenHeight / 4,
                        child: ListView.builder(itemBuilder: (context, index) {
                          return Container(
                            width: screenWidth / 1.5,
                            padding: const EdgeInsets.all(5),
                            margin: const EdgeInsets.only(bottom: 10),
                            color: Colors.grey.withOpacity(0.1),
                            child: const Row(
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: Text(
                                    "name",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    "010423356134",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    "2024-02-01",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    "2024-02-28",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    "100 LE",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                                Spacer(),
                                Expanded(
                                    flex: 1,
                                    child: Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    )),
                              ],
                            ),
                          );
                        }),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        onTap: () {
                          logic.create();
                        },
                        child: Container(
                          width: screenWidth / 6,
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
          ))
        ],
      ),
    );
  }
}
