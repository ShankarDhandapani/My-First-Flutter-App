import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  final List<Map<String, dynamic>> products;
  Products(this.products);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProductsState(products);
  }
}

class _ProductsState extends State<Products>{

  final List<Map<String, dynamic>> products;
  bool _favorite = false;

  _ProductsState(this.products) {
    print('[Products Widget] Constructor');
  }

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
      margin: EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
      elevation: 5.0,
      child: Column(
        children: <Widget>[
          Image.asset(products[index]['image']),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  products[index]['title'],
                  style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Merriweather'),
                ),
                SizedBox(
                  width: 40.0,
                ),
                Container(
                  padding: EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Text(
                    '\$ ' + products[index]['price'].toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Merriweather'),
                  ),
                ),
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
                onPressed: () => Navigator.pushNamed<bool>(
                    context, '/product/' + index.toString()),
              ),
              IconButton(
                icon: _favorite ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
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

  Widget _buildProductList() {
    Widget productCards;
    if (products.length > 0) {
      productCards = ListView.builder(
        itemBuilder: _buildProductItem,
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
