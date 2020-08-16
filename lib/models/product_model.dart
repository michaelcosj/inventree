import 'dart:collection';
import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:inventree/utils/product.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductModel extends ChangeNotifier {
  List<Product> _products = List<Product>();

  UnmodifiableListView<Product> get products => UnmodifiableListView(_products);

  void addProduct(Product product) {
    _products.add(product);
    saveData();

    notifyListeners();
  }

  void removeProduct(Product product) {
    _products.remove(product);
    saveData();
    notifyListeners();
  }

  void addBuyer(int index, String buyer, String dateSold, double amountSold) {
    _products[index].buyer.add(buyer);
    _products[index].dateSold.add(dateSold);
    _products[index].amountSold.add(amountSold);
    saveData();
    notifyListeners();
  }

  void updateStock(int index, int quantity) {
    if (_products[index].stock >= quantity) {
      _products[index].stock = _products[index].stock - quantity;
    }
    saveData();
    notifyListeners();
  }

  void setProfitMade(int index, int quantity, double amountSold) {
    double profit = (amountSold * quantity) - _products[index].cost;
    _products[index].profitMade.add(profit);

    saveData();
    notifyListeners();
  }

  void saveData() async {
    final sharedpref = await SharedPreferences.getInstance();
    List<String> spList = _products.map((e) => jsonEncode(e.toMap())).toList();

    sharedpref.setStringList('list', spList);
  }

  void loadData() async {
    final sharedpref = await SharedPreferences.getInstance();
    try {
      List<String> spList = sharedpref.getStringList('list');
      _products = spList.map((e) => Product.fromMap(jsonDecode(e))).toList();

      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
