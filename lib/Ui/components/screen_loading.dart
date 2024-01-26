import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ScreenLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          width: 30,
          height: 30,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            color: Colors.black,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          'Please wait...'.tr(),
        ),
      ],
    );
  }
}
