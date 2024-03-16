import 'package:flutter/material.dart';
import 'package:inkhaven/feature/signup_authenticate_feature/presentation/route/login_route.dart';
import 'package:inkhaven/feature/signup_authenticate_feature/presentation/route/reset_password_route.dart';
import 'package:inkhaven/feature/signup_authenticate_feature/presentation/route/sign_up_route.dart';

import 'feature/signup_authenticate_feature/presentation/route/welcome_route.dart';

class RouteNavigator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => const InkHavenInitialAppRoute());
      case '/LoginRoute':
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => const LoginRoute(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var tweenOffset =
                Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero);
            Animation<Offset> animationOffset = animation.drive(tweenOffset);
            return SlideTransition(
              position: animationOffset,
              child: child,
            );
          },
        );
      case '/SignUpRoute':
        return MaterialPageRoute(builder: (_) => const SignUpRoute());
      case '/ResetPasswordRoute':
        return MaterialPageRoute(builder: (_) => const ResetPasswordRoute());
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
        builder: (_) => const Scaffold(
              body: Center(
                child: Text('Error'),
              ),
            ));
  }
}
