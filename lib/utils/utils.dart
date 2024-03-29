import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../res/color.dart';
class Utils{
  static void fieldFocus(BuildContext context, FocusNode currentNode, FocusNode nextNode)
  {
    currentNode.unfocus();
    FocusScope.of(context).requestFocus(nextNode);
  }
  static toastMessage(String message){
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColors.primaryTextTextColor,
        textColor: AppColors.whiteColor,
        fontSize: 16.0
    );
  }
}