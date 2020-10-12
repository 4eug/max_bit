import 'package:flutter/material.dart';
import 'package:max_bit/routes/routes.dart';
import 'package:max_bit/services/local_storage_service.dart';
import 'package:max_bit/utils/app_config.dart';
import 'package:max_bit/utils/colors.dart';
import 'package:max_bit/utils/constants.dart';

class WalkThroughScreen extends StatefulWidget {
  @override
  _WalkThroughScreenState createState() => _WalkThroughScreenState();
}

class _WalkThroughScreenState extends State<WalkThroughScreen> {
  int slideIndex = 0;
  PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void pageChange() {
    if (slideIndex == 2) {
      LocalStorageService.saveToDisk(SavedPreferencesKeys.walkThrough, true);
      Navigator.of(context).pushNamedAndRemoveUntil(
          homeViewRoute, (Route<dynamic> route) => false);
    } else {
      _controller.animateToPage(slideIndex + 1,
          duration: Duration(milliseconds: 250), curve: Curves.linearToEaseOut);
    }
  }

  Widget _buildPageIndicator(bool isCurrentPage) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      height: isCurrentPage ? 10.0 : 6.0,
      width: isCurrentPage ? 10.0 : 6.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? primaryLight : darkAccent,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        controller: _controller,
        onPageChanged: (index) => setState(() => slideIndex = index),
        children: <Widget>[
          _pageBuilder(
            AvailableImages.walkThroughImg_1["assetPath"],
            "Variety",
            "Shop from a wide range of \n grocery on your phone",
          ),
          _pageBuilder(
            AvailableImages.walkThroughImg_2["assetPath"],
            "Reliable",
            "Buy any grocery\n and we will take care\n of the rest",
          ),
          _pageBuilder(
            AvailableImages.walkThroughImg_3["assetPath"],
            "Safe",
            "Shop online and avoid  \n contact with others",
          )
        ],
      ),
    );
  }

  Widget _pageBuilder(String imagePath, String title, String content) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      alignment: Alignment.center,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: SizeConfig.blockSizeVertical * 5,
            left: SizeConfig.blockSizeHorizontal * 10,
            right: SizeConfig.blockSizeHorizontal * 10,
            child: Container(
              height: SizeConfig.blockSizeVertical * 25,
              width: SizeConfig.blockSizeHorizontal * 40,
              child: Image.asset(
                AvailableImages.appLogo["assetPath"],
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: SizeConfig.blockSizeVertical * 30,
            left: SizeConfig.blockSizeHorizontal * 5,
            right: SizeConfig.blockSizeHorizontal * 5,
            child: Container(
              height: SizeConfig.blockSizeVertical * 35,
              width: SizeConfig.blockSizeHorizontal * 30,
              child: Image.asset(imagePath),
            ),
          ),
          Positioned(
            top: SizeConfig.blockSizeVertical * 68,
            left: SizeConfig.blockSizeHorizontal * 20,
            right: SizeConfig.blockSizeHorizontal * 20,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: AvailableFonts.secondaryFont,
                color: primaryLight,
                fontWeight: FontWeight.w600,
                fontSize: 35,
              ),
            ),
          ),
          Positioned(
            top: SizeConfig.blockSizeVertical * 74,
            left: SizeConfig.blockSizeHorizontal * 10,
            right: SizeConfig.blockSizeHorizontal * 10,
            child: Text(
              content,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: AvailableFonts.secondaryFont,
                color: primaryLight,
                fontWeight: FontWeight.w400,
                fontSize: 17,
                letterSpacing: 1.5,
              ),
            ),
          ),
          Positioned(
            top: SizeConfig.blockSizeVertical * 85,
            left: SizeConfig.blockSizeHorizontal * 5,
            right: SizeConfig.blockSizeHorizontal * 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < 3; i++)
                  i == slideIndex
                      ? _buildPageIndicator(true)
                      : _buildPageIndicator(false),
              ],
            ),
          ),
          Positioned(
            top: SizeConfig.blockSizeVertical * 90,
            left: SizeConfig.blockSizeHorizontal * 25,
            right: SizeConfig.blockSizeHorizontal * 25,
            child: Container(
              height: SizeConfig.blockSizeVertical * 6,
              width: SizeConfig.blockSizeHorizontal * 70,
              child: Material(
                borderRadius: BorderRadius.circular(5.0),
                color: primaryDark,
                elevation: 5.0,
                shadowColor: Colors.white70,
                child: MaterialButton(
                  onPressed: () => pageChange(),
                  child: Text(
                    slideIndex == 2 ? 'Get Started' : "Next",
                    style: TextStyle(
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w500,
                      fontFamily: AvailableFonts.secondaryFont,
                      fontSize: 15.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
