import 'package:flutter/material.dart';
import 'package:flutter_sqllite_poc/components/all_users_details.dart';
import 'package:flutter_sqllite_poc/components/login.dart';
import 'package:flutter_sqllite_poc/models/user_details_model.dart';
import 'package:flutter_sqllite_poc/components/user_details.dart';

class Routes {
  static dynamic goToRoute(RouteSettings routeSettings) {
    final UserDetailsModel routeArgs = routeSettings.arguments;

    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Login());
        break;
      case '/user_details':
        return MaterialPageRoute(
          builder: (_) => UserDetails(
            UserDetailsModel(routeArgs.username, routeArgs.password),
          ),
        );
        break;
      case '/all_users_details':
        return MaterialPageRoute(
          builder: (_) => AllUsersDetails(),
        );
        break;
    }
  }
}
