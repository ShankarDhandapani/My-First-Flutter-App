import 'package:flutter/material.dart';

import './price_tag.dart';

class ProductCard extends StatefulWidget {
  final Map<String, dynamic> products;
  final int productIndex;

  ProductCard(this.products, this.productIndex);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProductCard(products, productIndex);
  }
}

class _ProductCard extends State<ProductCard>{
  final Map<String, dynamic> products;
  final int productIndex;
  bool _favorite = false;

  _ProductCard(this.products, this.productIndex);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      margin: EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
      elevation: 5.0,
      child: Column(
        children: <Widget>[
          Image.asset(products['image']),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  products['title'],
                  style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Merriweather'),
                ),
                SizedBox(
                  width: 40.0,
                ),
                PriceTag(products['price'].toString())
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 1.4),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 2.0),
                  borderRadius: BorderRadius.circular(6.0)),
              child: Text('Coimbatore, Tamil Nadu')),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.info),
                color: Theme.of(context).accentColor,
                onPressed: () => Navigator.pushNamed<bool>(
                    context, '/product/' + productIndex.toString()),
              ),
              IconButton(
                icon: _favorite
                    ? Icon(Icons.favorite)
                    : Icon(Icons.favorite_border),
                color: Colors.red,
                onPressed: () {
                  setState(() {
                    _favorite = !_favorite;
                  });
                },
              )
            ],
          )
        ],
      ),
    );
  }
}