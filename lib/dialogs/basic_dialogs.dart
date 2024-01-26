import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Dialogs {
  void loadingDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) => const AlertDialog(
        contentPadding:
            EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10),
        content: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 20,
              height: 20,
              child: Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Please wait...',
            ),
          ],
        ),
      ),
    );
  }

  void messageDialog(
    BuildContext context,
    String message, {
    Function? function,
  }) async {
    await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) {
        return AlertDialog(
          contentPadding:
              const EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
          backgroundColor: Colors.black,
          content: Theme(
            data: ThemeData(
              textSelectionTheme: const TextSelectionThemeData(
                selectionColor: Colors.black,
              ),
            ),
            child: SelectableText(
              message,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
          actions: [
            InkWell(
              onTap: () {
                if (function == null) {
                  Navigator.pop(_);
                } else {
                  function();
                }
              },
              child: Container(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 5, bottom: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'Ok'.tr(),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
