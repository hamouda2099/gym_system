import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../config/constants.dart';
import '../components/side_menu.dart';

class SubscriptionDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                              "Subscription Details".tr(),
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
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.person_2,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Subscription Name",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.phone,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "01272736735",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Status",
                                  style: TextStyle(color: Colors.black),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "ON",
                                  style: TextStyle(color: Colors.green),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: screenWidth / 2,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Start".tr(),
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  Text(
                                    "End".tr(),
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                              Divider(
                                color: Colors.green,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "2024-01-10".tr(),
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  Text(
                                    "2024-02-10".tr(),
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: screenWidth / 4,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Price",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  Text(
                                    "300 LE",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Paid",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  Text(
                                    "150 LE",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Reminder",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  Text(
                                    "150 LE",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Offer Members".tr(),
                              style: const TextStyle(
                                color: Colors.orange,
                              ),
                            ),
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
                          child:
                              ListView.builder(itemBuilder: (context, index) {
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
                        const Divider(
                          color: Colors.black,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Container(
                                width: screenWidth / 8,
                                padding: const EdgeInsets.all(10),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Text(
                                  "Pay Reminder".tr(),
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                width: screenWidth / 8,
                                padding: const EdgeInsets.all(10),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Text(
                                  "Active".tr(),
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                width: screenWidth / 8,
                                padding: const EdgeInsets.all(10),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.orange,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Text(
                                  "Pause".tr(),
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                width: screenWidth / 8,
                                padding: const EdgeInsets.all(10),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Text(
                                  "Suspend".tr(),
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
