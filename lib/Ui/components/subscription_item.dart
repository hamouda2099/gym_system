import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gym_system/logic/services/date_formatter.dart';

import '../../config/constants.dart';
import '../../models/subscriptions_model.dart';

class SubscriptionItem extends StatelessWidget {
  SubscriptionItem({required this.subscribtion});
  Subscribtion subscribtion;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      color: Colors.white,
      padding: EdgeInsets.all(5),
      child: Row(
        children: [
          Container(
            width: screenWidth / 5,
            child: Text(
              subscribtion.name ?? '',
              style: TextStyle(color: Colors.black),
            ),
          ),
          Container(
            width: screenWidth / 10,
            child: Text(
              subscribtion.phone ?? '',
              style: TextStyle(color: Colors.black),
            ),
          ),
          Container(
            width: screenWidth / 10,
            child: Text(
              dateFormatter(subscribtion.startDate ?? ''),
              style: TextStyle(color: Colors.black),
            ),
          ),
          Container(
            width: screenWidth / 10,
            child: Text(
              subscribtion.endDate ?? '',
              style: TextStyle(color: Colors.black),
            ),
          ),
          Container(
            width: screenWidth / 15,
            child: Text(
              (subscribtion.price?.toString() ?? '') + ".LE".tr(),
              style: const TextStyle(color: Colors.black),
            ),
          ),
          Container(
            width: screenWidth / 15,
            child: Text(
              (subscribtion.paid?.toString() ?? '') + ".LE".tr(),
              style: TextStyle(color: Colors.black),
            ),
          ),
          Container(
            width: screenWidth / 15,
            child: Text(
              ((subscribtion.price! - subscribtion.paid!).toString() ?? '') +
                  ".LE".tr(),
              style: const TextStyle(color: Colors.black),
            ),
          ),
          const Spacer(),
          Container(
              alignment: Alignment.center,
              width: 50,
              child: InkWell(
                  onTap: () {},
                  child: const Icon(
                    Icons.edit,
                    color: Colors.black,
                  ))),
          const SizedBox(
            width: 5,
          ),
          Container(
              alignment: Alignment.center,
              width: 50,
              child: const InkWell(
                  child: Icon(
                Icons.delete,
                color: Colors.red,
              ))),
          const SizedBox(
            width: 5,
          ),
          Container(
              alignment: Alignment.center,
              width: 50,
              child: const InkWell(
                  child: Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
              ))),
        ],
      ),
    );
  }
}
