import 'package:flutter/material.dart';
import 'package:inventree/models/product_model.dart';
import 'package:inventree/utils/constants.dart';
import 'package:inventree/widgets/add_product_text_field.dart';
import 'package:inventree/widgets/material_custom_button.dart';
import 'package:inventree/widgets/popup_dialog.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatefulWidget {
  final int index;

  ProductPage({@required this.index});

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  String buyer, dateSold;

  int getIndex() {
    return widget.index;
  }

  void resetValues() {
    buyer = '';
    dateSold = '';
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
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                '${Provider.of<ProductModel>(context).products[getIndex()].name}',
                style: TextStyle(
                  color: kAppBackgroudColour,
                  fontWeight: FontWeight.w800,
                  fontSize: 30,
                ),
              ),
              Text(
                  '${Provider.of<ProductModel>(context).products[getIndex()].dateBought}'),
              Divider(),
              SizedBox(
                height: 10,
              ),
              Text(
                'Price(NGN): ${Provider.of<ProductModel>(context).products[getIndex()].price} ',
                style: TextStyle(
                  color: kAppBackgroudColour,
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Cost(NGN): ${Provider.of<ProductModel>(context).products[getIndex()].cost}',
                style: kProductDetailsTextStyle,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'No in Stock: ${Provider.of<ProductModel>(context).products[getIndex()].stock}',
                style: kProductDetailsTextStyle,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Profit(NGN): ${Provider.of<ProductModel>(context).products[getIndex()].getprofit()}',
                style: kProductDetailsTextStyle,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: Provider.of<ProductModel>(context)
                          .products[getIndex()]
                          .buyer
                          .isEmpty
                      ? 0
                      : Provider.of<ProductModel>(context)
                          .products[getIndex()]
                          .buyer
                          .length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Buyer: ${Provider.of<ProductModel>(context).products[getIndex()].buyer?.elementAt(index)} ',
                          style: kProductDetailsTextStyle,
                        ),
                        Text(
                          'Date Bought: ${Provider.of<ProductModel>(context).products[getIndex()].dateSold?.elementAt(index)}',
                          style: kProductDetailsTextStyle,
                        ),
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
                            hintText: 'Date bought',
                            keyboardType: TextInputType.datetime,
                            onChanged: (value) {
                              dateSold = value;
                            },
                          ),
                        ],
                        onPressed: () {
                          if (Provider.of<ProductModel>(context, listen: false)
                                      .products[getIndex()]
                                      .stock >
                                  0 &&
                              buyer != '' &&
                              dateSold != '') {
                            Provider.of<ProductModel>(context, listen: false)
                                .addBuyer(getIndex(), buyer, dateSold);

                            Provider.of<ProductModel>(context, listen: false)
                                .products[getIndex()]
                                .stock--;
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
          ),
        ),
      ),
    );
  }
}
