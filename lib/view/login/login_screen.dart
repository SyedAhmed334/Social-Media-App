import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../view_model/login/login_controller.dart';
import '../../res/components/input_text_field.dart';
import '../../res/components/round_button.dart';
import '../../utils/routes/route_name.dart';
import '../../utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final auth = FirebaseAuth.instance;
  final _key = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final emailFocusNode = FocusNode();
  final passwordController = TextEditingController();
  final passwordFocusNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;

    return Scaffold(
      resizeToAvoidBottomInset: true,
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
                  'Enter your email address \nto connect to your account',
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
                              Utils.fieldFocus(
                                  context, emailFocusNode, passwordFocusNode);
                            },
                            onValidate: (value) {
                              return value.isEmpty ? 'Enter your email' : null;
                            },
                            keyBoardType: TextInputType.emailAddress,
                            hint: 'Email',
                            obscureText: false),
                        SizedBox(height: height * 0.02),
                        InputTextField(
                            controller: passwordController,
                            focusNode: passwordFocusNode,
                            enable: true,
                            onFieldSubmittedValue: (value) {},
                            onValidate: (value) {
                              return value.isEmpty
                                  ? 'Enter your password'
                                  : null;
                            },
                            keyBoardType: TextInputType.text,
                            hint: 'Password',
                            obscureText: true),
                      ],
                    ),
                  ),
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () async{
                        Navigator.pushNamed(context, RouteName.forgotPasswordView);
                      },
                      child: Text(
                        'Forgot Password?',
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(fontSize: 15),
                      ),
                    )),
                SizedBox(
                  height: height * 0.05,
                ),
                ChangeNotifierProvider(
                  create: (context) => LoginController(),
                  child: Consumer<LoginController>(
                    builder: (context, value, child) {
                      return   RoundButton(
                        title: 'Login',
                        loading: value.loading,
                        onTap: () {
                          if (_key.currentState!.validate()) {
                            value.login(context, emailController.text, passwordController.text);
                          }
                        },
                      );

                    },
                  ),
                ),
                SizedBox(height: height * 0.02),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RouteName.signUpView);
                  },
                  child: Text.rich(
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontSize: 15),
                    TextSpan(text: 'Don\'t have an account? ', children: [
                      TextSpan(
                        text: 'Sign up',
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(
                                fontSize: 15,
                                decoration: TextDecoration.underline),
                      ),
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
