import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_system/Ui/components/side_menu.dart';
import 'package:gym_system/Ui/pagination_handlers/subscriptions_pagination.dart';
import 'package:gym_system/Ui/screens/create_subscription.dart';
import 'package:gym_system/config/constants.dart';

class Subscriptions extends ConsumerWidget {
  TextEditingController search = TextEditingController();
  final listReBuilder = StateProvider<String?>((ref) => null);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.search,
                            color: Colors.black,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          SizedBox(
                            width: screenWidth / 3,
                            child: TextField(
                              controller: search,
                              onChanged: (val) {
                                ref.read(listReBuilder.notifier).state =
                                    DateTime.now().toString();
                              },
                              decoration: const InputDecoration(
                                  border: InputBorder.none, hintText: 'search'),
                            ),
                          )
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CreateSubscription()));
                        },
                        child: Row(
                          children: [
                            Text(
                              "New Subscription".tr(),
                              style: const TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Icon(
                              Icons.add_box_outlined,
                              color: Colors.green,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      children: [
                        Container(
                          width: screenWidth / 5,
                          child: Text(
                            "Subscriber Name".tr(),
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          width: screenWidth / 10,
                          child: Text(
                            "Phone".tr(),
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          width: screenWidth / 10,
                          child: Text(
                            "Start Date".tr(),
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          width: screenWidth / 10,
                          child: Text(
                            "End Date".tr(),
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          width: screenWidth / 15,
                          child: Text(
                            "Price".tr(),
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          width: screenWidth / 15,
                          child: Text(
                            "Paid".tr(),
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          width: screenWidth / 15,
                          child: Text(
                            "Reminder".tr(),
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const Spacer(),
                        Container(
                          alignment: Alignment.center,
                          width: 50,
                          child: Text(
                            "Edit".tr(),
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 50,
                          child: Text(
                            "Delete".tr(),
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 50,
                          child: Text(
                            "Info".tr(),
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    color: Colors.black,
                    thickness: 1,
                  ),
                  Consumer(
                    builder: (context, ref, child) {
                      ref.watch(listReBuilder);
                      return Expanded(
                          child: SubscriptionsPagination(
                        query: search.text,
                      ));
                    },
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
