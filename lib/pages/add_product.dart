import 'package:flutter/material.dart';
import 'package:inventree/models/product_model.dart';
import 'package:inventree/utils/constants.dart';
import 'package:inventree/utils/product.dart';
import 'package:inventree/widgets/material_custom_button.dart';
import 'package:inventree/widgets/add_product_text_field.dart';
import 'package:provider/provider.dart';

class AddProduct extends StatelessWidget {
  static String productName, dateBought;
  static double costPrice, sellingPrice;
  static int nInStock;

  void reset() {
    productName = '';
    dateBought = '';
    costPrice = 0;
    sellingPrice = 0;
    nInStock = 0;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kAppBackgroudColour,
        ),
        backgroundColor: kAppBackgroudColour,
        body: Container(
          padding: EdgeInsets.all(30),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AddProductTextField(
                hintText: 'Product Name',
                onChanged: (value) {
                  productName = value;
                },
              ),
              AddProductTextField(
                hintText: 'Cost Price',
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  costPrice = double.parse(value);
                },
              ),
              AddProductTextField(
                hintText: 'Selling Price',
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  sellingPrice = double.parse(value);
                },
              ),
              AddProductTextField(
                hintText: 'Date Bought',
                keyboardType: TextInputType.datetime,
                onChanged: (value) {
                  dateBought = value;
                },
              ),
              AddProductTextField(
                width: 100,
                hintText: 'Number in stock',
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  nInStock = int.parse(value);
                },
              ),
              MaterialCustomButton(
                label: 'Add Product',
                onPressed: () {
                  if (productName != '') {
                    Provider.of<ProductModel>(context, listen: false)
                        .addProduct(
                      Product(
                        name: productName,
                        cost: costPrice,
                        price: sellingPrice,
                        stock: nInStock,
                        dateBought: dateBought,
                        buyer: [],
                        dateSold: [],
                        amountSold: [],
                        profitMade: [],
                      ),
                    );
                  }
                  Navigator.pop(context);
                  reset();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
