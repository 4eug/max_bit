import 'dart:async';

import 'package:flutter/material.dart';
import 'package:max_bit/routes/routes.dart';
import 'package:max_bit/utils/app_config.dart';
import 'package:max_bit/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var _walkThroughSeen;
  bool _hasSeenWalkThrough = true;

  bool _visible = false;

  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 2), () {
      setState(() {
        _visible = !_visible;
      });
    });
    loadData();
  }

  loadData() async {

    SharedPreferences myPrefs = await SharedPreferences.getInstance();

    _walkThroughSeen = myPrefs.getBool(SavedPreferencesKeys.walkThrough);

    print("WALK THROUGH VALUE: $_walkThroughSeen");

    if (_walkThroughSeen == null || _walkThroughSeen == false) {
      setState(() {
        _hasSeenWalkThrough = false;
      });
      print("USER HAS NOT SEEN WALK THROUGH");
    } else {
      print("USER HAS SEEN WALK THROUGH");
    }

    Timer(Duration(seconds: 4), () {
      if (_hasSeenWalkThrough) {
        Navigator.of(context).pushNamedAndRemoveUntil(
            homeViewRoute, (Route<dynamic> route) => false);
      } else {
        Navigator.of(context).pushNamedAndRemoveUntil(
            walkThroughViewRoute, (Route<dynamic> route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              color: Colors.white,
              // color: primaryLight,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Align(
                alignment: Alignment.center,
                child: Stack(
                  children: <Widget>[
                    AnimatedOpacity(
                      duration: Duration(seconds: 1),
                      opacity: _visible ? 1.0 : 0.0,
                      child: Container(
                        child: Image.asset(
                          AvailableImages.appLogoTransparent["assetPath"],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
