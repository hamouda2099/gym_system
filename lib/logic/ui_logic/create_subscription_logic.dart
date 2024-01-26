import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gym_system/Ui/screens/subscriptions.dart';
import 'package:gym_system/dialogs/basic_dialogs.dart';
import 'package:gym_system/logic/services/api_manger.dart';

class CreateSubscriptionLogic {
  late BuildContext context;

  TextEditingController fullNameCnt = TextEditingController();
  TextEditingController phoneCnt = TextEditingController();
  TextEditingController startDateCnt = TextEditingController();
  TextEditingController endDateCnt = TextEditingController();
  TextEditingController priceCnt = TextEditingController();
  TextEditingController paidCnt = TextEditingController();

  String? coachId;

  void create() {
    if (fullNameCnt.text.isEmpty ||
        phoneCnt.text.isEmpty ||
        startDateCnt.text.isEmpty ||
        endDateCnt.text.isEmpty ||
        priceCnt.text.isEmpty ||
        paidCnt.text.isEmpty) {
      Dialogs().messageDialog(context, "Fields required".tr());
    } else {
      Dialogs().loadingDialog(context);
      ApiManger.createSubscription(
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
