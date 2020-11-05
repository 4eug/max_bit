import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:max_bit/models/cart.dart';
import 'package:max_bit/models/product.dart';
import 'package:max_bit/utils/app_config.dart';
import 'package:max_bit/utils/colors.dart';
import 'package:max_bit/utils/constants.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  void displayBottomSheet(BuildContext context) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
      )),
      isDismissible: false,
      backgroundColor: Colors.white,
      context: context,
      builder: (ctx) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.35,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: SizeConfig.blockSizeHorizontal * 2,
                  right: SizeConfig.blockSizeHorizontal * 2,
                  top: SizeConfig.blockSizeVertical * 3,
                ),
                child: Image(
                  image: AvailableIcons.checkIcon["assetImage"],
                  // height: SizeConfig.blockSizeVertical * 30,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: SizeConfig.blockSizeHorizontal * 2,
                  right: SizeConfig.blockSizeHorizontal * 2,
                  top: SizeConfig.blockSizeVertical * 1,
                  bottom: SizeConfig.blockSizeVertical * 2,
                ),
                child: Text(
                  "Thank You",
                  style: TextStyle(
                    color: secondaryDark,
                    fontWeight: FontWeight.w600,
                    fontFamily: AvailableFonts.primaryFont,
                    letterSpacing: 1.2,
                    fontSize: 30.0,
                  ),
                ),
              ),
              Text(
                "Your purchase was successful...",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: darkAccent,
                  fontSize: 15.0,
                ),
              ),
              Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Container(
                    width: 90,
                    height: 45,
                    decoration: BoxDecoration(
                      color: secondaryDark,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60),
                      ),
                    ),
                    child: IconButton(
                      padding: EdgeInsets.all(10),
                      icon: Icon(
                        Icons.close,
                        size: 30,
                        color: Colors.black54,
                      ),
                      onPressed: () {
                        int count = 0;
                        Navigator.of(context).popUntil((_) => count++ >= 2);
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    final title = Text(
      "Your Cart",
      style: TextStyle(
        fontWeight: FontWeight.w600,
        color: Colors.white,
        fontSize: 20.0,
      ),
    );

    final backButton = IconButton(
      icon: Icon(
        Feather.arrow_left,
        size: 30.0,
        color: Colors.white,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    final welcomeMessage = Text(
      "Same day delivery",
      style: TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.white70,
          fontSize: 25.0,
          letterSpacing: 1.5),
    );

    var cartItems = Provider.of<Cart>(context, listen: true).cartItemAndCount();
    double totalCostPrice =
        Provider.of<Cart>(context, listen: true).totalPrice;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Material(
                  elevation: 5,
                  color: secondaryDark,
                  child: Container(
                    height: SizeConfig.blockSizeVertical * 25,
                    padding: EdgeInsets.only(top: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 30.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: backButton,
                          ),
                        ),Padding(
                          padding: EdgeInsets.only(top: 20.0, left: 30.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: title,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 2.0, left: 30.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "GH ₵ ${totalCostPrice.toStringAsFixed(2)}",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontSize: 30.0,
                                  letterSpacing: 1.5),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 2.0, left: 30.0, bottom: 30.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: welcomeMessage,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: SizeConfig.blockSizeHorizontal * 100,
                    padding: EdgeInsets.only(
                      left: SizeConfig.blockSizeHorizontal * 2,
                      right: SizeConfig.blockSizeHorizontal * 2,
                      bottom: SizeConfig.blockSizeHorizontal * 2,
                    ),

                    child: _buildCategoryList(
                      context,
                      cartItems,
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: SizeConfig.blockSizeVertical * 2,
              left: SizeConfig.blockSizeHorizontal * 5,
              right: SizeConfig.blockSizeHorizontal * 5,
              child: GestureDetector(
                onTap: () {
                  if (cartItems.length > 0) {
                    Provider.of<Cart>(context, listen: false).checkOut();
                    displayBottomSheet(context);
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: secondaryDark,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: Text(
                    "Checkout",
                    style: TextStyle(
                      fontSize: 15.0,
                      fontFamily: AvailableFonts.secondaryFont,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      // letterSpacing: 1.5,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCartListTile(
      BuildContext context, Product product, int quantity) {
    return Container(
      // width: SizeConfig.blockSizeHorizontal * 80,
      margin: EdgeInsets.only(
        top: 15.0,
        left: 17.0,
        right: 17.0,
        bottom: 15.0,
      ),
      padding: EdgeInsets.only(
        top: SizeConfig.blockSizeVertical * 3,
        bottom: SizeConfig.blockSizeVertical * 3,
        left: SizeConfig.blockSizeHorizontal * 2,
        right: SizeConfig.blockSizeHorizontal * 2,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
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
            Image.asset(
              product.image,
              height: 60,
              width: 70,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: SizeConfig.blockSizeHorizontal * 27,
                  child: Text(
                    product.title,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: AvailableFonts.secondaryFont,
                      letterSpacing: 1.0,
                      fontSize: 15.0,
                    ),
                  ),
                ),
                Container(
                  width: SizeConfig.blockSizeHorizontal * 20,
                  child: Text(
                    "GH ₵ ${product.price}",
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                      fontSize: 11.0,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  width: 100.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
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
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            Provider.of<Cart>(context, listen: false)
                                .add(product);
                          });
                        },
                        child: Container(
                          width: 27.0,
                          height: 30.0,
                          padding: EdgeInsets.zero,
                          child: Icon(
                            Icons.add,
                            size: 17,
                            color: secondaryDark,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          left: SizeConfig.blockSizeHorizontal * 1,
                          right: SizeConfig.blockSizeHorizontal * 1,
                        ),
                        child: Text(
                          quantity.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.withOpacity(1),
                            fontFamily: AvailableFonts.primaryFont,
                            letterSpacing: 1.2,
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          if (quantity > 1) {
                            Provider.of<Cart>(context, listen: false)
                                .remove(product);
                          }
                        },
                        child: Container(
                          width: 27.0,
                          height: 30.0,
                          padding: EdgeInsets.zero,
                          child: Icon(
                            Icons.remove,
                            size: 17,
                            color: secondaryDark,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      Provider.of<Cart>(context, listen: false)
                          .clearCart(product);
                    });
                  },
                  child: Container(
                    width: 30.0,
                    height: 30.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
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
                    padding: EdgeInsets.zero,
                    child: Icon(
                      Icons.delete,
                      size: 17,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryList(BuildContext context, List<dynamic> items) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (context, index) {
        var item = items[index];
        var product = item["product"];
        var quantity = item["quantity"];

        return _buildCartListTile(context, product, quantity);
      },
    );
  }
}
