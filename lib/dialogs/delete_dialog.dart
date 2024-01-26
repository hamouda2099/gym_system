import 'package:flutter/material.dart';

import '../config/constants.dart';

class DeleteDialog {
  void delete({
    BuildContext? context,
    String? message,
    Function? function,
  }) {
    showDialog(
      context: context!,
      builder: (_) => AlertDialog(
        title: Center(
          child: Text(
            message!,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        content: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(screenWidth),
                onTap: () {
                  function!();
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green,
                  ),
                  child: const Icon(
                    Icons.done,
                    color: Colors.white,
                  ),
                ),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(screenWidth),
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                  child: const Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
