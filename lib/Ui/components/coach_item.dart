import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gym_system/dialogs/basic_dialogs.dart';
import 'package:gym_system/logic/services/date_formatter.dart';
import 'package:gym_system/models/coaches_model.dart';

import '../../config/constants.dart';

class CoachItem extends StatelessWidget {
  CoachItem({required this.coach});
  Coach coach;
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
              coach.name ?? '',
              style: TextStyle(color: Colors.black),
            ),
          ),
          Container(
            width: screenWidth / 10,
            child: Text(
              coach.phone ?? '',
              style: TextStyle(color: Colors.black),
            ),
          ),
          Container(
            width: screenWidth / 8,
            child: Text(
              dateFormatter(coach.createdAt ?? ''),
              style: TextStyle(color: Colors.black),
            ),
          ),
          Container(
            width: screenWidth / 10,
            child: Text(
              "${coach.salary ?? ''}${"LE".tr()}",
              style: const TextStyle(color: Colors.black),
            ),
          ),
          Container(
            width: screenWidth / 15,
            child: Text(
              coach.hours?.toString() ?? '',
              style: TextStyle(color: Colors.black),
            ),
          ),
          const Spacer(),
          Container(
              alignment: Alignment.center,
              width: 50,
              child: const InkWell(
                  child: Icon(
                Icons.edit,
                color: Colors.black,
              ))),
          const SizedBox(
            width: 5,
          ),
          Container(
            alignment: Alignment.center,
            width: 50,
            child: InkWell(
              onTap: () {
                Dialogs().loadingDialog(context);
              },
              child: Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
          ),
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
