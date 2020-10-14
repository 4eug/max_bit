import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:max_bit/data/data.dart';
import 'package:max_bit/models/cart.dart';
import 'package:max_bit/models/product.dart';
import 'package:max_bit/routes/routes.dart';
import 'package:max_bit/utils/app_config.dart';
import 'package:max_bit/utils/colors.dart';
import 'package:max_bit/utils/constants.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatefulWidget {
  final String title;
  final String category;

  const ProductsScreen({Key key, this.title, this.category}) : super(key: key);

  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
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

    final title = Text(
      widget.title,
      style: TextStyle(
        fontWeight: FontWeight.w600,
        color: Colors.black,
        fontSize: 22.0,
      ),
    );

    final welcomeMessage = Text(
      "Select your favourite ${widget.title}",
      style: TextStyle(
        fontWeight: FontWeight.w600,
        color: darkAccent,
        fontSize: 12.0,
      ),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 20.0, left: 30.0),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: title,
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
                          Padding(
                            padding: EdgeInsets.only(right: 18.0),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: cart,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: SizeConfig.blockSizeHorizontal * 2,
                    right: SizeConfig.blockSizeHorizontal * 2,
                    bottom: SizeConfig.blockSizeHorizontal * 2,
                  ),
                  child: Container(
                    color: Colors.grey.withOpacity(0.05),
                    child: _buildCategoryList(
                        context,
                        getProducts().where((product) {
                          return product.category == widget.category;
                        }).toList()),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryListTile(BuildContext context, Product product) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(productViewRoute, arguments: {
          "product": product,
        });
      },
      child: Container(
        // width: SizeConfig.blockSizeHorizontal * 80,
        margin: EdgeInsets.only(
          top: 15.0,
          left: 30.0,
          right: 30.0,
          bottom: 15.0,
        ),
        padding: EdgeInsets.only(
          top: SizeConfig.blockSizeVertical * 3,
          bottom: SizeConfig.blockSizeVertical * 3,
          left: SizeConfig.blockSizeHorizontal * 7,
          right: SizeConfig.blockSizeHorizontal * 7,
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
              Hero(
                tag: "productTag${product.id}",
                transitionOnUserGestures: true,
                child: Image.asset(
                  product.image,
                  height: 60,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: SizeConfig.blockSizeHorizontal * 25,
                    child: Text(
                      product.title,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w500,
                        fontFamily: AvailableFonts.secondaryFont,
                        fontSize: 11.0,
                      ),
                    ),
                  ),
                  Text(
                    "GH ₵ ${product.price}",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: AvailableFonts.primaryFont,
                      letterSpacing: 1.2,
                      fontSize: 15.0,
                    ),
                  ),
                ],
              ),
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

        return _buildCategoryListTile(context, item);
      },
    );
  }
}
