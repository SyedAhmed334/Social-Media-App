import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../utils/routes/route_name.dart';
import '../../utils/utils.dart';

class ForgotController with ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  bool _loading = false;

  bool get loading => _loading;

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void forgotPassword(BuildContext context, String email) async {
    setLoading(true);
    try {
      auth
          .sendPasswordResetEmail(email: email)
          .then((value) {
        setLoading(false);
        Navigator.pushNamed(context, RouteName.loginView);
        Utils.toastMessage('please check your email for password reset');
      }).onError((error, stackTrace) {
        setLoading(false);
        Utils.toastMessage(
          error.toString(),
        );
      });
    } catch (e) {
      setLoading(false);
      Utils.toastMessage(
        e.toString(),
      );
    }
    notifyListeners();
  }
}
