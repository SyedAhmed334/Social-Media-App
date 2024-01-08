import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tech_media/view_model/services/session_controller.dart';

import '../../utils/routes/route_name.dart';
import '../../utils/utils.dart';

class LoginController with ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  bool _loading = false;

  bool get loading => _loading;

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void login(BuildContext context, String email, String password) async {
    setLoading(true);
    try {
      auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        setLoading(false);
        SessionController().userId = auth.currentUser!.uid;
        Navigator.pushNamed(context, RouteName.dashBoardView);
        Utils.toastMessage('Login success!');
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
