import 'package:flutter/material.dart';
import 'package:tech_media/view/dashboard/dashboard.dart';
import 'package:tech_media/view/forgotPassword/forgot_password.dart';
import 'package:tech_media/view/login/login_screen.dart';
import 'package:tech_media/view/signup/sign_up_screen.dart';

import '../../view/splash/splash_screen.dart';
import 'route_name.dart';


class Routes {

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case RouteName.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case RouteName.loginView:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case RouteName.signUpView:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());

      case RouteName.dashBoardView:
        return MaterialPageRoute(builder: (_) => const DashBoardScreen());

      case RouteName.forgotPasswordView:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());

      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          );
        });
    }
  }
}