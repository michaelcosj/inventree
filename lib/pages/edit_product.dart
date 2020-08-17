import 'package:flutter/material.dart';
import 'package:inventree/models/product_model.dart';
import 'package:inventree/utils/constants.dart';
import 'package:inventree/utils/product.dart';
import 'package:inventree/widgets/material_custom_button.dart';
import 'package:inventree/widgets/add_product_text_field.dart';
import 'package:provider/provider.dart';

class EditProduct extends StatelessWidget {
  final int index;
  final Product product;
  EditProduct({@required this.index, @required this.product});

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
                hintText: '${product.name}',
                onChanged: (value) {
                  product.name = value;
                },
              ),
              AddProductTextField(
                hintText: '${product.cost}',
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  product.cost = double.parse(value);
                },
              ),
              AddProductTextField(
                hintText: '${product.price}',
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  product.price = double.parse(value);
                },
              ),
              AddProductTextField(
                hintText: '${product.dateBought}',
                keyboardType: TextInputType.datetime,
                onChanged: (value) {
                  product.dateBought = value;
                },
              ),
              AddProductTextField(
                width: 100,
                hintText: '${product.stock}',
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  product.stock = int.parse(value);
                },
              ),
              MaterialCustomButton(
                label: 'Edit Product',
                onPressed: () {
                  if (product.name != '') {
                    Provider.of<ProductModel>(context, listen: false)
                        .editProduct(
                      product,
                      index,
                    );
                  }
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
