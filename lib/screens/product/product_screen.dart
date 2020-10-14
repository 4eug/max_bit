import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:max_bit/models/cart.dart';
import 'package:max_bit/models/product.dart';
import 'package:max_bit/utils/app_config.dart';
import 'package:max_bit/utils/colors.dart';
import 'package:max_bit/utils/constants.dart';
import 'package:max_bit/utils/utils.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  final Product product;

  const ProductScreen({Key key, this.product}) : super(key: key);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int itemQuantity = 0;

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
                "Items added to cart",
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

    var cartItems;
    cartItems = Provider.of<Cart>(context, listen: true).count;


    final cart = Container(
      width: 50,
      height: 50,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: Icon(
              Feather.shopping_cart,
              size: 20.0,
              color: Colors.black,
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
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
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 18.0, top: 10),
                child: Align(
                  alignment: Alignment.topRight,
                  child: cart,
                ),
              ),
              Material(
                color: Colors.white,
                elevation: 0,
                child: Container(
                  height: SizeConfig.blockSizeVertical * 30,
                  margin: EdgeInsets.only(
                    top: 15.0,
                    left: 30.0,
                    right: 30.0,
                  ),
                  padding: EdgeInsets.only(
                    top: SizeConfig.blockSizeVertical * 3,
                    bottom: SizeConfig.blockSizeVertical * 3,
                    left: SizeConfig.blockSizeHorizontal * 7,
                    right: SizeConfig.blockSizeHorizontal * 7,
                  ),
                  child: Hero(
                    tag: "productTag${widget.product.id}",
                    transitionOnUserGestures: true,
                    child: Image.asset(
                      widget.product.image,
                      height: SizeConfig.blockSizeVertical * 30,
                      width: SizeConfig.blockSizeHorizontal * 80,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: SizeConfig.blockSizeHorizontal * 100,
                  margin: EdgeInsets.only(
                    left: 10.0,
                    right: 10.0,
                    bottom: 5.0,
                  ),
                  padding: EdgeInsets.only(
                    top: SizeConfig.blockSizeVertical * 2,
                    bottom: SizeConfig.blockSizeVertical * 3,
                    left: SizeConfig.blockSizeHorizontal * 2,
                    right: SizeConfig.blockSizeHorizontal * 2,
                  ),
                  color: Colors.grey.withOpacity(0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        toTitleCase(widget.product.category),
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: AvailableFonts.secondaryFont,
                          letterSpacing: 1.2,
                          fontSize: 17.0,
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical * 3,
                      ),
                      Text(
                        "GH ₵ ${widget.product.price.toString()}",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: AvailableFonts.primaryFont,
                          letterSpacing: 1.2,
                          fontSize: 30.0,
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical * 1,
                      ),
                      Text(
                        widget.product.title,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: AvailableFonts.secondaryFont,
                          letterSpacing: 1.2,
                          fontSize: 17.0,
                        ),
                      ),
                      Container(
                        height: SizeConfig.blockSizeVertical * 20,
                        child: Text(
                          widget.product.description,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 6,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: darkAccent,
                            wordSpacing: 2,
                            height: 2,
                            fontFamily: AvailableFonts.primaryFont,
                            letterSpacing: 1.2,
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                      Container(
                        width: SizeConfig.blockSizeHorizontal * 30,
                        margin: EdgeInsets.only(
                          top: SizeConfig.blockSizeVertical * 2,
                          left: SizeConfig.blockSizeHorizontal * 2,
                          right: SizeConfig.blockSizeHorizontal * 2,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 35.0,
                              height: 35.0,
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                  setState(() {
                                    itemQuantity++;
                                  });
                                },
                                disabledColor: secondaryDark,
                                child: Icon(Icons.add),
                              ),
                            ),
                            Container(
                              child: Text(
                                itemQuantity.toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey.withOpacity(1),
                                  fontFamily: AvailableFonts.primaryFont,
                                  letterSpacing: 1.2,
                                  fontSize: 15.0,
                                ),
                              ),
                            ),
                            Container(
                              width: 35.0,
                              height: 35.0,
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                  setState(() {
                                    if (itemQuantity > 0) {
                                      itemQuantity--;
                                    }
                                  });
                                },
                                disabledColor: secondaryDark,
                                child: Icon(Icons.remove),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Align(
                alignment: FractionalOffset.bottomCenter,
                child: GestureDetector(
                  onTap: () {
                    if (itemQuantity > 0) {
                      for (int i = 0; i < itemQuantity; i++) {
                        Provider.of<Cart>(context, listen: false)
                            .add(widget.product);
                      }
                      displayBottomSheet(context);
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: secondaryDark,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                    ),
                    child: Text(
                      "Add to cart",
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
      ),
    );
  }
}
