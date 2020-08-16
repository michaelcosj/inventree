import 'package:flutter/material.dart';
import 'package:inventree/models/product_model.dart';
import 'package:inventree/pages/product_page.dart';
import 'package:inventree/utils/constants.dart';
import 'package:provider/provider.dart';

class ItemListTile extends StatelessWidget {
  final int index;

  ItemListTile({this.index});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductModel>(builder: (context, product, child) {
      return ListTile(
        title: Text(
          product.products[index].name,
          style: TextStyle(
            color: kAppBackgroudColour,
            fontWeight: FontWeight.w600,
            fontSize: 25,
          ),
        ),
        subtitle: Text(
          'Date Bought: ${product.products[index].dateBought}\nStock: ${product.products[index].stock}',
          style: TextStyle(fontSize: 18),
        ),
        trailing: IconButton(
            icon: Icon(
              Icons.delete,
              color: Colors.red,
              size: 25,
            ),
            onPressed: () {
              product.removeProduct(product.products[index]);
            }),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductPage(
                index: index,
              ),
            ),
          );
        },
      );
    });
  }
}
