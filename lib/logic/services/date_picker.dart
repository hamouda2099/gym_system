import 'package:flutter/material.dart';

Future<String> pickDate(BuildContext context) async {
  String selectedDate = '';
  String month;
  String day;
  await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(DateTime.now().year),
    lastDate: DateTime(DateTime.now().year + 50),
  ).then((value) {
    if (value != null) {
      if (value.month < 10) {
        month = "0${value.month}";
      } else {
        month = value.month.toString();
      }
      if (value.day < 10) {
        day = "0${value.day}";
      } else {
        day = value.day.toString();
      }
      selectedDate = "${value.year}-$month-$day";
    }
  });
  return selectedDate;
}
