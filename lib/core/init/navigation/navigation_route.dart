import 'package:flutter/material.dart';
import '../../components/cards/not_found_navigation_widget.dart';
import '../../constants/navigation/navigation_constants.dart';
import '../../../view/authentication/test/view/test_view.dart';

class NavigationRoute {
  static late NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.TEST_VIEW:
        return normalNavigate(TestView());

      default:
        return MaterialPageRoute(
            builder: (context) => NotFoundNavigationWidget());
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }
}
