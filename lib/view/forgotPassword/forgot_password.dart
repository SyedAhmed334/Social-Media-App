import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_media/view_model/forgot_password/forgot_password_controller.dart';
import '../../view_model/login/login_controller.dart';
import '../../res/components/input_text_field.dart';
import '../../res/components/round_button.dart';
import '../../utils/routes/route_name.dart';
import '../../utils/utils.dart';
class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final auth = FirebaseAuth.instance;
  final _key = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final emailFocusNode = FocusNode();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    emailFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.05, vertical: height * 0.1),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: height * 0.01),
                Text(
                  'Social Media App',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                SizedBox(height: height * 0.01),
                Text(
                  'Enter your email address \nto reset your password',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                SizedBox(height: height * 0.01),
                Form(
                  key: _key,
                  child: Padding(
                    padding: EdgeInsets.only(top: height * 0.06),
                    child: Column(
                      children: [
                        InputTextField(
                            controller: emailController,
                            focusNode: emailFocusNode,
                            enable: true,
                            onFieldSubmittedValue: (value) {
                            },
                            onValidate: (value) {
                              return value.isEmpty ? 'Enter your email' : null;
                            },
                            keyBoardType: TextInputType.emailAddress,
                            hint: 'Enter your email here...',
                            obscureText: false),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                ChangeNotifierProvider(
                  create: (context) => ForgotController(),
                  child: Consumer<ForgotController>(
                    builder: (context, value, child) {
                      return   RoundButton(
                        title: 'Submit',
                        loading: value.loading,
                        onTap: () {
                          if (_key.currentState!.validate()) {
                           // value.login(context, emailController.text, passwordController.text);
                            value.forgotPassword(context, emailController.text);
                          }
                        },
                      );

                    },
                  ),
                ),
                SizedBox(height: height * 0.02),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
