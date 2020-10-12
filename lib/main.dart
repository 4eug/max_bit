import 'package:flutter/material.dart';
import 'package:max_bit/models/cart.dart';
import 'package:max_bit/routes/router.dart' as router;
import 'package:max_bit/routes/routes.dart';
import 'package:max_bit/utils/app_config.dart';
import 'package:max_bit/utils/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Root of application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      // Provider state management for user cart
      providers: [
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
      ],
      child: MaterialApp(
        // app name
        title: AppConfig.appName,

        // app theme
        theme: AppTheme.mainTheme,

        // disable test banner
        debugShowCheckedModeBanner: false,

        //make flutter aware of app routes using router generator in router.dart file
        onGenerateRoute: router.generateRoute,

        // initial screen when app is opened
        initialRoute: splashViewRoute,
      ),
    );
  }
}
