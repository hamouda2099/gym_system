import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_system/Ui/components/side_menu.dart';
import 'package:gym_system/Ui/pagination_handlers/sessions_pagination.dart';
import 'package:gym_system/config/constants.dart';

import 'create_session.dart';

class Sessions extends ConsumerWidget {
  TextEditingController search = TextEditingController();
  final listReBuilder = StateProvider<String?>((ref) => null);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                          Container(
                            width: screenWidth / 3,
                            child: TextField(
                              controller: search,
                              onChanged: (val) {
                                ref.read(listReBuilder.notifier).state =
                                    DateTime.now().toString();
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'search'.tr(),
                              ),
                            ),
                          )
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          createSession(context);
                        },
                        child: Row(
                          children: [
                            Text(
                              "New Session".tr(),
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
                        SizedBox(
                          width: screenWidth / 3,
                          child: Text(
                            "Name".tr(),
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: screenWidth / 6,
                          child: Text(
                            "Date".tr(),
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: screenWidth / 10,
                          child: Text(
                            "Cost".tr(),
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Container(
                          alignment: Alignment.center,
                          width: 50,
                          child: Text(
                            "Delete".tr(),
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
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
                        child: SessionsPagination(
                          query: search.text,
                        ),
                      );
                    },
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
