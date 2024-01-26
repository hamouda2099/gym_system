import 'package:flutter/material.dart';
import 'package:gym_system/logic/services/date_formatter.dart';
import 'package:gym_system/models/sessions_model.dart';

import '../../config/constants.dart';

class SessionItem extends StatelessWidget {
  SessionItem({required this.session});
  Session session;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      color: Colors.white,
      padding: const EdgeInsets.all(5),
      child: Row(
        children: [
          Container(
            width: screenWidth / 3,
            child: Text(
              session.name ?? '',
              style: const TextStyle(color: Colors.black),
            ),
          ),
          Container(
            width: screenWidth / 6,
            child: Text(
              dateFormatter(session.createdAt ?? ''),
              style: const TextStyle(color: Colors.black),
            ),
          ),
          Container(
            width: screenWidth / 10,
            child: Text(
              session.cost?.toStringAsFixed(2) ?? '',
              style: const TextStyle(color: Colors.black),
            ),
          ),
          const Spacer(),
          Container(
            alignment: Alignment.center,
            width: 50,
            child: InkWell(
              onTap: () {},
              child: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
