import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gym_system/Ui/screens/subscriptions.dart';
import 'package:gym_system/dialogs/basic_dialogs.dart';
import 'package:gym_system/logic/services/api_manger.dart';
import 'package:gym_system/models/subscription_model.dart';

class EditSubscriptionLogic {
  late BuildContext context;
  late String? subscriptionId;

  TextEditingController fullNameCnt = TextEditingController();
  TextEditingController phoneCnt = TextEditingController();
  TextEditingController startDateCnt = TextEditingController();
  TextEditingController endDateCnt = TextEditingController();
  TextEditingController priceCnt = TextEditingController();
  TextEditingController paidCnt = TextEditingController();

  String? coachId;

  void init(SubscriptionModel? subscription) {
    fullNameCnt.text = subscription?.subscription?.name ?? '';
    phoneCnt.text = subscription?.subscription?.phone ?? '';
    startDateCnt.text = subscription?.subscription?.startDate ?? '';
    endDateCnt.text = subscription?.subscription?.endDate ?? '';
    priceCnt.text = subscription?.subscription?.price?.toString() ?? '';
    paidCnt.text = subscription?.subscription?.paid?.toString() ?? '';
    coachId = subscription?.subscription?.coachId?.toString() ?? '';
  }

  void edit() {
    if (fullNameCnt.text.isEmpty ||
        phoneCnt.text.isEmpty ||
        startDateCnt.text.isEmpty ||
        endDateCnt.text.isEmpty ||
        priceCnt.text.isEmpty ||
        paidCnt.text.isEmpty) {
      Dialogs().messageDialog(context, "Fields required".tr());
    } else {
      Dialogs().loadingDialog(context);
      ApiManger.updateSubscription(
              id: subscriptionId,
              fullName: fullNameCnt.text,
              phone: phoneCnt.text,
              startDate: startDateCnt.text,
              endDate: endDateCnt.text,
              price: priceCnt.text,
              paid: paidCnt.text)
          .then((value) {
        Navigator.pop(context);
        if (value['statusCode'] == 200) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Subscriptions()));
        } else {
          Dialogs().messageDialog(context, value['message']);
        }
      });
    }
  }
}
