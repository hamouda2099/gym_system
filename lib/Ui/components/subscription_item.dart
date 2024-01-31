import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_system/Ui/screens/subscription_details.dart';
import 'package:gym_system/logic/services/api_manger.dart';

import '../../config/constants.dart';
import '../../dialogs/basic_dialogs.dart';
import '../../models/subscriptions_model.dart';
import '../screens/edit_subscription_screen.dart';

class SubscriptionItem extends ConsumerWidget {
  SubscriptionItem({required this.subscribtion, required this.provider});
  Subscribtion subscribtion;
  StateProvider provider;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
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
              subscribtion.startDate ?? '',
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
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditSubscription(
                      subscriptionId: subscribtion.id.toString(),
                    ),
                  ),
                );
              },
              child: const Icon(
                Icons.edit,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Container(
              alignment: Alignment.center,
              width: 50,
              child: InkWell(
                  onTap: () {
                    Dialogs().loadingDialog(context);
                    ApiManger.deleteSubscription(id: subscribtion.id.toString())
                        .then((value) {
                      Navigator.pop(context);
                      if (value['statusCode'] == 200) {
                        ref.read(provider.notifier).state =
                            DateTime.now().toString();
                      } else {
                        Dialogs()
                            .messageDialog(context, value['message'] ?? '');
                      }
                    });
                  },
                  child: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ))),
          const SizedBox(
            width: 5,
          ),
          Container(
            alignment: Alignment.center,
            width: 50,
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SubscriptionDetails(
                              subscriptionId: subscribtion.id.toString(),
                            )));
              },
              child: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
