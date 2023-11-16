import 'package:flutter/material.dart';
import 'package:sleektask/screens/login_screen.dart';
import 'package:sleektask/screens/register_screen.dart';
import 'package:sleektask/utils/presentations/common_error_screen.dart';
import 'package:sleektask/utils/presentations/shared_animation.dart';

class WorkForceRouter {
  WorkForceRouter._();

  static Widget Function(BuildContext, Animation<double>, Animation<double>)
      _getBuilder(Widget screen) {
    return (context, _, __) => screen;
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    // FRRouter.generateRoute(settings);
    Widget Function(
      BuildContext context,
      Animation<double>,
      Animation<double>,
    ) builder;
    print('ROUTE: ${settings.name ?? ''}');
    switch (settings.name) {
      case LoginScreen.routeName:
        builder = _getBuilder(const LoginScreen());
        break;
      case RegisterScreen.routeName:
        builder = _getBuilder(const RegisterScreen());
        break;

      default:
        builder = _getBuilder(const CommonErrorScreen());
    }

    return PageRouteBuilder(
      pageBuilder: builder,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return SharedAxisTransition(
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          transitionType: SharedAxisTransitionType.scaled,
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 200),
    );
  }
}

class Routes {
  Routes._();
  static const String loginScreen = '/login';
  static const String registerScreen = '/registerScreen';
}
