import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_system/Ui/screens/coaches.dart';
import 'package:gym_system/dialogs/basic_dialogs.dart';
import 'package:gym_system/logic/services/api_manger.dart';

class CreateCoachLogic {
  late BuildContext context;
  TextEditingController nameCnt = TextEditingController();
  TextEditingController passCnt = TextEditingController();
  TextEditingController phoneCnt = TextEditingController();
  TextEditingController hoursCnt = TextEditingController();
  TextEditingController salaryCnt = TextEditingController();

  final roleProvider = StateProvider<String?>((ref) => null);

  void create() {
    if (nameCnt.text.isEmpty ||
        passCnt.text.isEmpty ||
        phoneCnt.text.isEmpty ||
        hoursCnt.text.isEmpty ||
        salaryCnt.text.isEmpty) {
      Dialogs().messageDialog(context, "Fields Required");
    } else {
      Dialogs().loadingDialog(context);
      ApiManger.createCoach(
              name: nameCnt.text,
              phone: phoneCnt.text,
              password: passCnt.text,
              hours: hoursCnt.text,
              salary: salaryCnt.text)
          .then((value) {
        Navigator.pop(context);
        if (value['statusCode'] == 200) {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return Coaches();
          }));
        } else {
          Dialogs().messageDialog(context, value['message']);
        }
      });
    }
  }
}
