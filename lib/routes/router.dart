import 'package:flutter/material.dart';
import 'package:max_bit/routes/routes.dart';
import 'package:max_bit/screens/Cart/cart_screen.dart';
import 'package:max_bit/screens/Dashboard/dashboard_screen.dart';
import 'package:max_bit/screens/Product/product_screen.dart';
import 'package:max_bit/screens/Product/products_screen.dart';
import 'package:max_bit/screens/general/splash_screen.dart';
import 'package:max_bit/screens/general/walk_through_screen.dart';
import 'package:max_bit/screens/home/home_screen.dart';
import 'package:max_bit/screens/orders/order_screen.dart';
import 'package:max_bit/screens/test_screen.dart';
import 'package:page_transition/page_transition.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  final Map<String, dynamic> arguments = settings.arguments;

  switch (settings.name) {
    case splashViewRoute:
      return PageTransition(
        child: SplashScreen(),
        type: PageTransitionType.fade,
      );
    case walkThroughViewRoute:
      return PageTransition(
        child: WalkThroughScreen(),
        type: PageTransitionType.fade,
      );
    case homeViewRoute:
      return PageTransition(
        child: HomeScreen(),
        type: PageTransitionType.fade,
      );
    case productsViewRoute:
      return PageTransition(
        child: ProductsScreen(
            title: arguments["title"],
          category: arguments["category"],
        ),
        type: PageTransitionType.fade,
      );
    case productViewRoute:
      return PageTransition(
        child: ProductScreen(
            product: arguments["product"],
        ),
        type: PageTransitionType.fade,
      );
    case cartViewRoute:
      return PageTransition(
        child: CartScreen(),
        type: PageTransitionType.fade,
      );
    case orderHistoryViewRoute:
      return PageTransition(
        child: OrderHistoryScreen(),
        type: PageTransitionType.fade,
      );
    case dashboardViewRoute:
      return PageTransition(
        child: DashboardScreen(),
        type: PageTransitionType.fade,
      );
    case testViewRoute:
      return PageTransition(
        child: TestScreen(
          testInput: arguments["test_input"],
        ),
        type: PageTransitionType.fade,
      );
    default:
      return PageTransition(
        child: HomeScreen(),
        type: PageTransitionType.fade,
      );
  }
}
