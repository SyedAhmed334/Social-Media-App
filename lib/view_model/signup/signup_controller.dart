import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../../utils/utils.dart';
import '../../../utils/routes/route_name.dart';
import '../services/session_controller.dart';

class SignUpController with ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref('Users');
  bool _loading = false;

  bool get loading => _loading;

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void signUp(
      BuildContext context, String userName, String email, String password) async{
    setLoading(true);
    try {
      auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        setLoading(false);
        SessionController().userId = auth.currentUser!.uid;
        ref.child(value.user!.uid.toString()).set({
          'uid': value.user!.uid,
          'username': userName,
          'email': value.user!.email,
          'onlineStatus': "none",
          'phone': "",
          'profile': ""
        }).then((value) {
          Navigator.pushNamed(context, RouteName.dashBoardView);
          Utils.toastMessage('Data uploaded on database');
        }).onError((error, stackTrace) {
          Utils.toastMessage(error.toString());
        });
        Utils.toastMessage('user is created!');
      }).onError((error, stackTrace) {
        setLoading(false);
        Utils.toastMessage(error.toString());
      });
    } catch (e) {
      setLoading(false);
      Utils.toastMessage(e.toString());
    }
    notifyListeners();
  }
}
