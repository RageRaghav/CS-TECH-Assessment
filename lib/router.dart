import 'package:cs_tech_assessment/screens/challenge_screen.dart';
import 'package:cs_tech_assessment/screens/chart_screen.dart';
import 'package:cs_tech_assessment/screens/dashboard.dart';
import 'package:cs_tech_assessment/screens/otp_verification.dart';
import 'package:cs_tech_assessment/screens/signin.dart';
import 'package:cs_tech_assessment/screens/signup.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case SignupScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const SignupScreen(),
      );

    case OTPScreen.routeName:
      final email = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => OTPScreen(email: email),
      );

    case SigninScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const SigninScreen(),
      );

    case TwoMinuteChallenge.routeName:
      final args = routeSettings.arguments as Map<String, dynamic>;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => TwoMinuteChallenge(
          email: args['email'],
          username: args['username'],
          userID: args['userID'],
        ),
      );

    case DashboardScreen.routeName:
      final args = routeSettings.arguments as Map<String, dynamic>;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => DashboardScreen(
          email: args['email'],
          username: args['username'],
          userID: args['userID'],
        ),
      );

    case PieChartScreen.routeName:
      final args = routeSettings.arguments as Map<String, dynamic>;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => PieChartScreen(
          email: args['email'],
          username: args['username'],
          userID: args['userID'],
        ),
      );

    default:
      return MaterialPageRoute(
        builder: (_) =>
            const Scaffold(body: Center(child: Text("No route exists"))),
      );
  }
}
