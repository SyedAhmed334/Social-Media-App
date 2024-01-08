import 'package:flutter/material.dart';

import '../color.dart';

class InputTextField extends StatelessWidget {
  const InputTextField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.onFieldSubmittedValue,
    required this.onValidate,
    required this.keyBoardType,
    required this.hint,
    required this.obscureText,
    this.autoFocus = false,
    this.enable = true,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final FormFieldSetter onFieldSubmittedValue;
  final FormFieldValidator onValidate;

  final TextInputType keyBoardType;
  final String hint;
  final bool obscureText;
  final bool enable, autoFocus;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextFormField(
        controller: controller,
        enabled: enable,
        onFieldSubmitted: onFieldSubmittedValue,
        validator: onValidate,
        focusNode: focusNode,
        obscureText: obscureText,
        autofocus: autoFocus,
        keyboardType: keyBoardType,
        style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(fontSize: 19, height: 0),
        decoration: InputDecoration(
          hintText: hint,
          contentPadding: const EdgeInsets.all(15),
          hintStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: AppColors.primaryTextTextColor.withOpacity(0.8), height: 0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: AppColors.textFieldDefaultFocus,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: AppColors.primaryColor, width: 3),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
                color: AppColors.textFieldDefaultBorderColor, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: AppColors.alertColor, width: 2),
          ),
        ),
      ),
    );
  }
}
