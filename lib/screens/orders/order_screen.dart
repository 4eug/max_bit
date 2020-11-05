import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:max_bit/models/cart.dart';
import 'package:max_bit/models/product.dart';
import 'package:max_bit/utils/app_config.dart';
import 'package:max_bit/utils/colors.dart';
import 'package:max_bit/utils/constants.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:max_bit/utils/utils.dart';

class NewItem {
  bool isExpanded;
  final String header;
  final Widget body;
  final Icon iconpic;

  NewItem({this.isExpanded, this.header, this.body, this.iconpic});
}

class OrderHistoryScreen extends StatefulWidget {
  @override
  _OrderHistoryScreenState createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

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

    final title = Text(
      "Purchase History",
      style: TextStyle(
        fontWeight: FontWeight.w600,
        color: Colors.white,
        fontFamily: AvailableFonts.secondaryFont,
        fontSize: 27.0,
      ),
    );

    List<dynamic> orderHistory =
        Provider.of<Cart>(context, listen: true).getOrderHistory();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: secondaryDark,
      body: SafeArea(
        child: Column(
          children: [
            Material(
              elevation: 5,
              color: secondaryDark,
              child: Container(
                height: SizeConfig.blockSizeVertical * 25,
                padding: EdgeInsets.only(top: 15.0),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 18.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: backButton,
                      ),
                    ),
                    Container(
                      height: SizeConfig.blockSizeVertical * 15,
                      padding: EdgeInsets.only(top: 25.0, left: 30),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: title,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _buildOrderList(context, orderHistory.reversed.toList())
          ],
        ),
      ),
    );
  }



  Widget _buildOrderListTile(BuildContext context, List<Product> products, String date, double totalCost) {

    var distinctItems = distinctItemsAndCount(products);

    List<Widget> items = List();

    for(var item in distinctItems){
      var product = item["product"];
      var quantity = item["quantity"];

      items.add(Container(
        margin: EdgeInsets.only(
          top: 20.0,
          left: 20.0,
          right: 20.0,
          bottom: 15.0,
        ),
        padding: EdgeInsets.only(
          left: SizeConfig.blockSizeHorizontal * 2,
          right: SizeConfig.blockSizeHorizontal * 2,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${product.title}  x  $quantity",
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w500,
                fontFamily: AvailableFonts.secondaryFont,
                fontSize: 11.0,
              ),
            ),
            Text(
              "${(product.price * quantity).toStringAsFixed(2)}",
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w500,
                fontFamily: AvailableFonts.secondaryFont,
                fontSize: 11.0,
              ),
            )
          ],
        ),
      ));
    }


    return Container(
      margin: EdgeInsets.only(
        top: 20.0,
        left: 20.0,
        right: 20.0,
        bottom: 15.0,
      ),
      padding: EdgeInsets.only(
        // top: SizeConfig.blockSizeVertical * 2,
        // bottom: SizeConfig.blockSizeVertical * 2,
        left: SizeConfig.blockSizeHorizontal * 2,
        right: SizeConfig.blockSizeHorizontal * 2,
      ),
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
      child: ExpansionTile(
        title: Text(
          date,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontFamily: AvailableFonts.primaryFont,
            letterSpacing: 1.0,
            fontSize: 17.0,
          ),
        ),
        subtitle: Text(
          "GH ₵ ${totalCost.toStringAsFixed(2)}",
          overflow: TextOverflow.ellipsis,
          softWrap: false,
          style: TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.w500,
            fontSize: 11.0,
          ),
        ),
        children: <Widget>[
          Column(children: <Widget>[
            Container(
                height: 20,
                padding: EdgeInsets.only(
                  left: SizeConfig.blockSizeHorizontal * 2,
                  right: SizeConfig.blockSizeHorizontal * 2,
                ),
                child: Divider(
                  thickness: 1.5,
                )),
            Column(
              children: items,
            ),
          ]),
        ],
      ),
    );
  }

  Widget _buildOrderList(BuildContext context, List<dynamic> orders) {
    return Expanded(
      child: Container(
        color: Colors.white,
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: orders.length,
          itemBuilder: (context, index) {
            var order = orders[index];

            var date = order["date"];
            var totalCost = order["total_cost"];
            var products = order["products"];

            return _buildOrderListTile(context, products, date, totalCost);
          },
        ),
      ),
    );
  }
}
