import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gym_system/config/constants.dart';
import 'package:gym_system/logic/ui_logic/login_logic.dart';

class Login extends StatelessWidget {
  LoginLogic logic = LoginLogic();
  @override
  Widget build(BuildContext context) {
    logic.context = context;
    return Scaffold(
        body: Container(
      width: screenWidth,
      height: screenHeight,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/images/login_bg.png"),
        ),
      ),
      child: Container(
        width: screenWidth,
        height: screenHeight,
        color: Colors.black.withOpacity(0.8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/logo.png",
              width: screenWidth / 3,
              height: screenHeight / 3,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: screenWidth / 4,
              decoration: BoxDecoration(
                color: fieldColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: logic.usernameCnt,
                style: const TextStyle(
                  color: Colors.grey,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Username".tr(),
                  hintStyle: TextStyle(
                    color: Colors.white.withOpacity(0.1),
                  ),
                  prefixIcon: Icon(
                    Icons.person,
                    color: Colors.white.withOpacity(0.1),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: screenWidth / 4,
              decoration: BoxDecoration(
                color: fieldColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: logic.passwordCnt,
                obscureText: true,
                style: const TextStyle(color: Colors.grey),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                      color: Colors.white.withOpacity(0.1),
                    ),
                    hintText: "Password".tr(),
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.white.withOpacity(0.1),
                    )),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                logic.login();
              },
              child: Container(
                width: screenWidth / 4,
                padding: const EdgeInsets.all(15),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Colors.yellow,
                        Colors.orange,
                      ],
                    )),
                child: Text(
                  "Login".tr(),
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
