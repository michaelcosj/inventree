import 'package:flutter/material.dart';
import 'package:inventree/models/product_model.dart';
import 'package:inventree/pages/edit_product.dart';
import 'package:inventree/utils/constants.dart';

import 'package:inventree/widgets/add_product_text_field.dart';
import 'package:inventree/widgets/material_custom_button.dart';
import 'package:inventree/widgets/popup_dialog.dart';
import 'package:inventree/widgets/switch_page.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatelessWidget {
  final int index;

  ProductPage({@required this.index});

  static String buyer, dateSold;
  static int quantity = 0;
  static double amountPaid = 0;

  void resetValues() {
    buyer = '';
    dateSold = '';
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kAppBackgroudColour,
          actions: [
            IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  Navigator.of(context).push(switchPage(
                    EditProduct(
                      index: index,
                      product: Provider.of<ProductModel>(context, listen: false)
                          .products[index],
                    ),
                  ));
                })
          ],
        ),
        backgroundColor: kAppBackgroudColour,
        body: Container(
          padding: EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: Consumer<ProductModel>(
            builder: (context, product, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    '${product.products[index].name}',
                    style: TextStyle(
                      color: kAppBackgroudColour,
                      fontWeight: FontWeight.w800,
                      fontSize: 30,
                    ),
                  ),
                  Text('${product.products[index].dateBought}'),
                  Divider(),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Selling Price(NGN): ${product.products[index].price} ',
                    style: TextStyle(
                      color: kAppBackgroudColour,
                      fontWeight: FontWeight.w800,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'Cost Price(NGN): ${product.products[index].cost}',
                    style: kProductDetailsTextStyle,
                  ),
                  Text(
                    'No in Stock: ${product.products[index].stock}',
                    style: kProductDetailsTextStyle,
                  ),
                  Text(
                    'Profit(NGN): ${product.products[index].getprofit()}\nTotal Profit(NGN):${product.products[index].getTotalprofit()}',
                    style: kProductDetailsTextStyle,
                  ),
                  Divider(),
                  Expanded(
                    child: ListView.builder(
                      itemCount: product.products[index].buyer.isEmpty
                          ? 0
                          : product.products[index].buyer.length,
                      itemBuilder: (BuildContext context, int item) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Buyer: ${product.products[index].buyer?.elementAt(item)} ',
                              style: kProductDetailsTextStyle,
                            ),
                            Text(
                              'Date Bought: ${product.products[index].dateSold?.elementAt(item)}',
                              style: kProductDetailsTextStyle,
                            ),
                            Text(
                              'Amount Paid: ${product.products[index].amountSold?.elementAt(item)}',
                              style: kProductDetailsTextStyle,
                            ),
                            Text(
                              'Profit Made For Sale: ${product.products[index].profitMade?.elementAt(item)}',
                              style: kProductDetailsTextStyle,
                            )
                          ],
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  MaterialCustomButton(
                    label: 'Add Buyer',
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return PopupDialog(
                            children: [
                              AddProductTextField(
                                hintText: 'Buyer\'s name',
                                onChanged: (value) {
                                  buyer = value;
                                },
                              ),
                              AddProductTextField(
                                hintText: 'Date sold',
                                keyboardType: TextInputType.datetime,
                                onChanged: (value) {
                                  dateSold = value;
                                },
                              ),
                              Row(
                                children: [
                                  AddProductTextField(
                                      width: 150,
                                      hintText: 'Quantity sold',
                                      keyboardType: TextInputType.number,
                                      onChanged: (value) {
                                        quantity = int.parse(value);
                                      }),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  AddProductTextField(
                                      width: 150,
                                      hintText: 'Amount paid',
                                      keyboardType: TextInputType.number,
                                      onChanged: (value) {
                                        amountPaid = double.parse(value);
                                      }),
                                ],
                              ),
                            ],
                            onPressed: () {
                              if (product.products[index].stock > 0 &&
                                  buyer != '' &&
                                  dateSold != '') {
                                product.addBuyer(
                                    index, buyer, dateSold, amountPaid);
                                product.updateStock(index, quantity);
                                product.setProfitMade(
                                    index, quantity, amountPaid);
                              }
                              resetValues();
                              Navigator.pop(context);
                            },
                          );
                        },
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
