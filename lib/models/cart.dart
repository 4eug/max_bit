import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:max_bit/models/product.dart';
import 'package:max_bit/utils/utils.dart';

List<Product> _products = [];
List<dynamic> _cartCount = [];
List<dynamic> _orderHistory = [];

dynamic _totalPrice = 0.0;

class Cart extends ChangeNotifier {
  var format = DateFormat('MMMM d, yyyy');
  DateTime _dateTime;

  void add(Product item) {
    _products.add(item);
    _totalPrice += item.price;

    _cartCount = distinctItemsAndCount(_products);

    notifyListeners();
  }

  void remove(Product item) {
    _totalPrice -= item.price;
    _products.remove(item);

    _cartCount = distinctItemsAndCount(_products);

    notifyListeners();
  }

  void clearCart(Product item) {
    int numOfItems = countOccurrences(_products, item);
    for (int i = 0; i < numOfItems; i++) {
      remove(item);
    }

    notifyListeners();
  }

  void checkOut() {
    _dateTime = DateTime.now();

    _orderHistory.add({
      "date": format.format(_dateTime),
      "total_cost": _totalPrice,
      "products": _products,
    });

    _totalPrice = 0.0;
    _products = [];
    _cartCount = [];
    _dateTime = null;

    notifyListeners();
  }

  int get count {
    return _products.length;
  }

  dynamic get totalPrice {
    return _totalPrice;
  }

  List<Product> get cartItems {
    return _products;
  }

  dynamic getOrderHistory() {
    if (_orderHistory != null || _orderHistory.length != 0) {
      return _orderHistory;
    }

    return [];
  }

  dynamic cartItemAndCount() {
    return _cartCount;
  }

}
