import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_system/Ui/components/side_menu.dart';
import 'package:gym_system/Ui/pagination_handlers/coaches_pagination.dart';
import 'package:gym_system/config/constants.dart';

import 'create_coach.dart';

class Coaches extends ConsumerWidget {
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
                                hintText: 'search'.tr()),
                          ),
                        )
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CraeteCoach()));
                      },
                      child: Row(
                        children: [
                          Text(
                            "New Coach".tr(),
                            style: const TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
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
                  padding: EdgeInsets.all(5),
                  child: Row(
                    children: [
                      Container(
                        width: screenWidth / 5,
                        child: const Text(
                          "Coach Name",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        width: screenWidth / 10,
                        child: const Text(
                          "Phone",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        width: screenWidth / 8,
                        child: const Text(
                          "join Date",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        width: screenWidth / 10,
                        child: const Text(
                          "Salary",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        width: screenWidth / 15,
                        child: const Text(
                          "Hours",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        alignment: Alignment.center,
                        width: 50,
                        child: const Text(
                          "Edit",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 50,
                        child: const Text(
                          "Delete",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 50,
                        child: const Text(
                          "Info",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
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
                      child: CoachesPagination(
                        query: search.text,
                      ),
                    );
                  },
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
