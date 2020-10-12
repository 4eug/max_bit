import 'dart:async';

import 'package:flutter/material.dart';
import 'package:max_bit/routes/routes.dart';
import 'package:max_bit/utils/app_config.dart';
import 'package:max_bit/utils/colors.dart';
import 'package:max_bit/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var _walkThroughSeen;
  bool _hasSeenWalkThrough = true;

  @override
  void initState() {
    super.initState();
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

    Timer(Duration(seconds: 3), () {
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
      // backgroundColor: Colors.white,
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              color: primaryLight,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Align(
                alignment: Alignment.center,
                child: Stack(
                  children: <Widget>[
                    Container(
//                      padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 30),
                      child: Image.asset(
                        AvailableImages.appLogoTransparent["assetPath"],
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
