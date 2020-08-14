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

  void addBuyer(int index, String buyer, String dateSold) {
    _products[index].buyer.add(buyer);
    _products[index].dateSold.add(dateSold);
    saveData();
    notifyListeners();
  }

//I'll make use of this function in a future version, my client said that it isn't needed.
  void removeProduct(Product product) {
    _products.remove(product);

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
