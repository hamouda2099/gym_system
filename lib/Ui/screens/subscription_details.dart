import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../config/constants.dart';
import '../../logic/services/api_manger.dart';
import '../../models/subscription_model.dart';
import '../components/screen_loading.dart';
import '../components/side_menu.dart';

class SubscriptionDetails extends StatelessWidget {
  SubscriptionDetails({this.subscriptionId});
  String? subscriptionId;
  Subscription? subscription;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Row(
        children: [
          const SideMenu(),
          FutureBuilder<SubscriptionModel>(
            future: ApiManger.getSubscriptionById(id: subscriptionId),
            builder: (BuildContext context,
                AsyncSnapshot<SubscriptionModel> snapShot) {
              switch (snapShot.connectionState) {
                case ConnectionState.waiting:
                  {
                    return ScreenLoading();
                  }
                default:
                  if (snapShot.hasError) {
                    return Text('Error: ${snapShot.error}');
                  } else {
                    subscription = snapShot.data?.subscription;
                    return Expanded(
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
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.person_2,
                                            color: Colors.black,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            subscription?.name ?? '',
                                            style: const TextStyle(
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.phone,
                                            color: Colors.black,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            subscription?.phone ?? '',
                                            style: const TextStyle(
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Text(
                                            "Status",
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            subscription?.status
                                                    ?.toUpperCase() ??
                                                '',
                                            style: const TextStyle(
                                                color: Colors.green),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
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
                                              style: const TextStyle(
                                                  color: Colors.black),
                                            ),
                                            Text(
                                              "End".tr(),
                                              style: const TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                        const Divider(
                                          color: Colors.green,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              subscription?.startDate ?? '',
                                              style: const TextStyle(
                                                  color: Colors.black),
                                            ),
                                            Text(
                                              subscription?.endDate ?? '',
                                              style: const TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    width: screenWidth / 4,
                                    padding: const EdgeInsets.all(10),
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
                                              "Price".tr(),
                                              style: const TextStyle(
                                                  color: Colors.black),
                                            ),
                                            Text(
                                              "${subscription?.price ?? ''} LE",
                                              style: const TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Paid".tr(),
                                              style: const TextStyle(
                                                  color: Colors.black),
                                            ),
                                            Text(
                                              "${subscription?.paid ?? ''} LE",
                                              style: const TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Reminder".tr(),
                                              style: const TextStyle(
                                                  color: Colors.black),
                                            ),
                                            Text(
                                              "${(subscription!.price! - subscription!.paid!).toStringAsFixed(2)} LE",
                                              style: const TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
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
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: Text(
                                            "Pay Reminder".tr(),
                                            style: const TextStyle(
                                                color: Colors.white),
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
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: Text(
                                            "Active".tr(),
                                            style: const TextStyle(
                                                color: Colors.white),
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
                                            color: Colors.orange,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: Text(
                                            "Pause".tr(),
                                            style: const TextStyle(
                                                color: Colors.white),
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
                                            color: Colors.red,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: Text(
                                            "Suspend".tr(),
                                            style: const TextStyle(
                                                color: Colors.white),
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
                    );
                  }
              }
            },
          )
        ],
      ),
    );
  }
}
