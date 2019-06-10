import 'package:flutter/material.dart';

class ProductControl extends StatelessWidget {
  final Function addProduct;
  final String text;

  ProductControl({this.addProduct, this.text});

  @override
    Widget build(BuildContext context) {
      return RaisedButton(
            color: Theme.of(context).primaryColor,
            onPressed: () {
              addProduct({'title': 'Chocolate', 'image': 'assets/food.jpg'});
            },
            child: Text(text),
          );
    }
}