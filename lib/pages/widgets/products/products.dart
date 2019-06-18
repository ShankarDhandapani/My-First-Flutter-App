import 'package:flutter/material.dart';

import './product_card.dart';

class Products extends StatefulWidget {
  final List<Map<String, dynamic>> products;
  Products(this.products);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProductsState(products);
  }
}

class _ProductsState extends State<Products> {
  final List<Map<String, dynamic>> products;
  

  _ProductsState(this.products) {
    print('[Products Widget] Constructor');
  }

  Widget _buildProductList() {
    Widget productCards;
    if (products.length > 0) {
      productCards = ListView.builder(
        itemBuilder: (BuildContext context, int index) => ProductCard(products[index], index),
        itemCount: products.length,
      );
    } else {
      productCards = Container();
    }
    return productCards;
  }

  @override
  Widget build(BuildContext context) {
    print('[Products Widget] build()');
    return _buildProductList();
  }
}
