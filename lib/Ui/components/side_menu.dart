import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gym_system/Ui/screens/coaches.dart';
import 'package:gym_system/Ui/screens/sessions.dart';
import 'package:gym_system/Ui/screens/subscriptions.dart';

import '../../config/constants.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth / 8,
      height: screenHeight,
      color: fieldColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Subscriptions()));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Subscriptions".tr(),
                style: TextStyle(
                    color: Colors.grey.withOpacity(0.4),
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Sessions()));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Sessions".tr(),
                style: TextStyle(
                    color: Colors.grey.withOpacity(0.4),
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Coaches()));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Coaches".tr(),
                style: TextStyle(
                    color: Colors.grey.withOpacity(0.4),
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Reports".tr(),
              style: TextStyle(
                  color: Colors.grey.withOpacity(0.4),
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
