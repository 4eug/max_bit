import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:max_bit/models/cart.dart';
import 'package:max_bit/routes/routes.dart';
import 'package:max_bit/utils/app_config.dart';
import 'package:max_bit/utils/colors.dart';
import 'package:max_bit/utils/constants.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  var categories = [
    {
      "title": "Fruits",
      "category": ProductCategories.fruits,
      "textColor": Color(0xFFFBAD70),
      "backgroundColor": Color(0xFFFFF9E9),
      "image": AvailableImages.fruits["assetPath"],
    },
    {
      "title": "Veggies",
      "category": ProductCategories.vegetables,
      "textColor": Color(0xFF41A58B),
      "backgroundColor": Color(0xFFE5F4F1),
      "image": AvailableImages.veggies["assetPath"],
    },
    {
      "title": "Jewelry",
      "category": "jewelry",
      "textColor": Color(0xFFAE7351),
      "backgroundColor": Color(0xFFEFEEDC),
      "image": AvailableImages.jewelery["assetPath"],
    },
    {
      "title": "Electronics",
      "category": ProductCategories.electronics,
      "textColor": Color(0xFF18CFB3),
      "backgroundColor": Color(0xFFF0FAFB),
      "image": AvailableImages.electronics["assetPath"],
    },
    {
      "title": "Men's Wear",
      "category": ProductCategories.menClothing,
      "textColor": Colors.tealAccent[500],
      "backgroundColor": Colors.tealAccent[100],
      "image": AvailableImages.menClothing["assetPath"],
    },
    {
      "title": "Women's Wear",
      "category": ProductCategories.womenClothing,
      "textColor": Color(0xFFA97EC8),
      "backgroundColor": Color(0xFFF0FAFB),
      "image": AvailableImages.womenClothing["assetPath"],
    },
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    final dashboard = IconButton(
      icon: Icon(
        Feather.menu,
        size: 30.0,
        color: Colors.black,
      ),
      onPressed: () {
        _scaffoldKey.currentState.openDrawer();
      },
    );

    final title = Text(
      "Max bit",
      style: TextStyle(
        fontWeight: FontWeight.w500,
        color: Colors.black54,
        fontSize: 30.0,
      ),
    );

    final welcomeMessage = Text(
      "Select your favourite category",
      style: TextStyle(
        fontWeight: FontWeight.w600,
        color: darkAccent,
        fontSize: 15.0,
      ),
    );

    var cartItems;
    cartItems = Provider.of<Cart>(context, listen: true).count;
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: SizeConfig.blockSizeVertical * 30,
              child: Image.asset(
                AvailableImages.appLogoTransparent["assetPath"],
              ),
            ),
            InkWell(
              onTap: () =>
                  Navigator.popAndPushNamed(context, orderHistoryViewRoute),
              child: Text(
                "Orders",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black54,
                  fontSize: 30.0,
                ),
              ),
            ),
            Text(
              "FAQs",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black54,
                fontSize: 30.0,
              ),
            ),
            Text(
              "About",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black54,
                fontSize: 30.0,
              ),
            ),
            Text(
              "Log Out",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black54,
                fontSize: 30.0,
              ),
            ),
            IconButton(
              icon: Icon(
                Feather.arrow_left_circle,
                size: 30.0,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 5,
        color: Colors.white,
        // color: lightAccent,
        clipBehavior: Clip.antiAlias,
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            FlatButton(
              child: Icon(Feather.home),
              onPressed: () => Navigator.pushNamed(context, homeViewRoute),
            ),
            Stack(
              children: [
                FlatButton(
                  child: Icon(Feather.shopping_cart),
                  onPressed: () => Navigator.pushNamed(context, cartViewRoute),
                ),
                Positioned(
                  top: 5,
                  left: 20,
                  child: Text(
                    cartItems.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                )
              ],
            ),
            FlatButton(
              child: Icon(Feather.list),
              onPressed: () =>
                  Navigator.pushNamed(context, orderHistoryViewRoute),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Material(
                color: Colors.white,
                elevation: 0,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 15.0),
                      child: Padding(
                        padding: EdgeInsets.only(left: 18.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: dashboard,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0, left: 30.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: title,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 2.0, left: 30.0, bottom: 30.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: welcomeMessage,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding:
                      EdgeInsets.only(top: SizeConfig.blockSizeVertical * 2),
                  child: _buildCategoryList(context, categories),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryListTile(
    BuildContext context,
    String title,
    String category,
    String image,
    Color textColor,
    Color backgroundColor,
  ) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(productsViewRoute, arguments: {
          "title": title,
          "category": category,
        });
      },
      child: Container(
        // width: SizeConfig.blockSizeHorizontal * 80,
        margin: EdgeInsets.only(
          top: 2.0,
          left: 30.0,
          right: 30.0,
          bottom: 30.0,
        ),
        padding: EdgeInsets.only(
          top: SizeConfig.blockSizeVertical * 6,
          bottom: SizeConfig.blockSizeVertical * 6,
          left: SizeConfig.blockSizeHorizontal * 10,
          right: SizeConfig.blockSizeHorizontal * 10,
        ),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 2.0, // soften the shadow
              spreadRadius: 0.5, //extend the shadow
              offset: Offset(
                0, // Move to right 10  horizontally
                0, // Move to bottom 10 Vertically
              ),
            )
          ],
        ),
        child: Align(
          alignment: Alignment.topLeft,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w500,
                  fontFamily: AvailableFonts.secondaryFont,
                  letterSpacing: 1.2,
                  fontSize: 15.0,
                ),
              ),
              Image.asset(
                image,
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryList(BuildContext context, List<dynamic> items) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];

        return _buildCategoryListTile(
          context,
          item["title"],
          item["category"],
          item["image"],
          item["textColor"],
          item["backgroundColor"],
        );
      },
    );
  }
}
