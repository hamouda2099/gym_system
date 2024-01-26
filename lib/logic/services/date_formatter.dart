import 'package:intl/intl.dart';

String dateFormatter(String date) {
  String formattedDate = '';

  try {
    var dateFormat = DateFormat("dd-MM-yyyy");
    var utcDate =
        dateFormat.format(DateTime.parse(date).add(const Duration(hours: 3)));
    var localDate = dateFormat.parse(utcDate, true).toString();
    formattedDate = dateFormat.format(DateTime.parse(localDate));
  } catch (_) {}

  return formattedDate;
}
