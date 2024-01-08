import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../utils/routes/route_name.dart';
import '../../view_model/signup/signup_controller.dart';

import '../../res/components/input_text_field.dart';
import '../../res/components/round_button.dart';
import '../../utils/utils.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _key = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final emailFocusNode = FocusNode();
  final passwordController = TextEditingController();
  final passwordFocusNode = FocusNode();
  final userNameController = TextEditingController();
  final userNameFocusNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    userNameController.dispose();
    userNameFocusNode.dispose();
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
              horizontal: width * 0.05, vertical: height * 0.05),
          child: ChangeNotifierProvider(
            create: (context) => SignUpController(),
            child: Consumer<SignUpController>(
              builder: (context, provider, child) {
                return SingleChildScrollView(
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
                        'Enter your email address \nto register your account',
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
                                  controller: userNameController,
                                  focusNode: userNameFocusNode,
                                  enable: true,
                                  onFieldSubmittedValue: (value) {
                                    Utils.fieldFocus(context, userNameFocusNode,
                                        emailFocusNode);
                                  },
                                  onValidate: (value) {
                                    return value.isEmpty
                                        ? 'Enter your username'
                                        : null;
                                  },
                                  keyBoardType: TextInputType.emailAddress,
                                  hint: 'Username',
                                  obscureText: false),
                              SizedBox(height: height * 0.02),
                              InputTextField(
                                  controller: emailController,
                                  focusNode: emailFocusNode,
                                  enable: true,
                                  onFieldSubmittedValue: (value) {
                                    Utils.fieldFocus(context, emailFocusNode,
                                        passwordFocusNode);
                                  },
                                  onValidate: (value) {
                                    return value.isEmpty
                                        ? 'Enter your email'
                                        : null;
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
                      SizedBox(
                        height: height * 0.07,
                      ),
                      RoundButton(
                        title: 'SignUp',
                        loading: provider.loading,
                        onTap: () {
                          if (_key.currentState!.validate()) {
                            provider.signUp(context, userNameController.text,
                                emailController.text, passwordController.text);
                          }
                        },
                      ),
                      SizedBox(height: height * 0.02),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, RouteName.loginView);
                        },
                        child: Text.rich(
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(fontSize: 15),
                          TextSpan(
                              text: 'Already have an account? ',
                              children: [
                                TextSpan(
                                  text: 'Login',
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
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
