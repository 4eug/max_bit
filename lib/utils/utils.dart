import 'package:flutter/material.dart';
import 'package:max_bit/models/product.dart';

// convert hex color for use in flutter
class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

String toTitleCase(String str) {
  return str
      .replaceAllMapped(
          RegExp(
              r'[A-Z]{2,}(?=[A-Z][a-z]+[0-9]*|\b)|[A-Z]?[a-z]+[0-9]*|[A-Z]|[0-9]+'),
          (Match m) =>
              "${m[0][0].toUpperCase()}${m[0].substring(1).toLowerCase()}")
      .replaceAll(RegExp(r'(_|-)+'), ' ');
}

int countOccurrences(List<Product> list, Product element) {
  if (list == null || list.isEmpty) {
    return 0;
  }

  var foundElements = list.where((e) => e == element);
  return foundElements.length;
}

dynamic distinctItemsAndCount(List<Product> products) {
  List<Product> cartCopy = products;
  var deduplicateCart = cartCopy.toSet().toList();

  var tempCartCount = [];

  for (var product in deduplicateCart) {
    tempCartCount.add(
        {"product": product, "quantity": countOccurrences(products, product)});
  }
  return tempCartCount;
}
