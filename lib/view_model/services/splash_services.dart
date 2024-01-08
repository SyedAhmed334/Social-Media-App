import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tech_media/utils/routes/route_name.dart';
import 'package:tech_media/view_model/services/session_controller.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    if (auth.currentUser == null) {
      Future.delayed(
        const Duration(seconds: 3),
        () => Navigator.pushNamed(context, RouteName.loginView),
      );
    } else {
      SessionController().userId = auth.currentUser!.uid;
      Future.delayed(
        const Duration(seconds: 3),
        () => Navigator.pushNamed(context, RouteName.dashBoardView),
      );
    }
  }
}
