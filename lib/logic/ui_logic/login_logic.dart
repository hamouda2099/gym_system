import 'package:flutter/material.dart';
import 'package:gym_system/Ui/screens/subscriptions.dart';
import 'package:gym_system/models/login_model.dart';

import '../../config/user_data.dart';
import '../../dialogs/basic_dialogs.dart';
import '../services/api_manger.dart';

class LoginLogic {
  late BuildContext context;
  TextEditingController usernameCnt = TextEditingController();
  TextEditingController passwordCnt = TextEditingController();

  void login() {
    Dialogs().loadingDialog(context);
    ApiManger.login(
      name: usernameCnt.text,
      password: passwordCnt.text,
    ).then((value) {
      if (value['statusCode'] == 200) {
        User.coach = LoginModel.fromJson(value).coach;
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Subscriptions()));
      } else {
        Navigator.pop(context);
        Dialogs().messageDialog(context,
            value['message']?.toString() ?? 'Error ${value['statusCode']}!',
            function: () {
          Navigator.pop(context);
        });
      }
    });
  }
}
