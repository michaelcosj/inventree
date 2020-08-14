import 'package:flutter/material.dart';
import 'package:inventree/models/product_model.dart';
import 'package:inventree/pages/add_product.dart';
import 'package:inventree/pages/product_page.dart';
import 'package:inventree/utils/constants.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Provider.of<ProductModel>(context, listen: false).loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddProduct(),
              ),
            );
          },
          child: Icon(
            Icons.add,
            size: 30,
          ),
          backgroundColor: kAppBackgroudColour,
        ),
        backgroundColor: kAppBackgroudColour,
        body: Container(
          padding: EdgeInsets.only(top: 50),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Image.asset('assets/images/icon.png'),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'INVENTREE',
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 40,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  child: ListView.builder(
                      itemCount:
                          Provider.of<ProductModel>(context).products.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            Provider.of<ProductModel>(context)
                                .products[index]
                                .name,
                            style: TextStyle(
                              color: kAppBackgroudColour,
                              fontWeight: FontWeight.w600,
                              fontSize: 25,
                            ),
                          ),
                          subtitle: Text(
                            'Date Bought: ${Provider.of<ProductModel>(context).products[index].dateBought}',
                            style: TextStyle(fontSize: 18),
                          ),
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
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
