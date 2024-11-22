import 'package:flutter/material.dart';
import 'package:flutter_provider/models/product.dart';
import 'package:provider/provider.dart';

import '../screens/product_detail_screen.dart';

class ProductItem extends StatefulWidget{

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Product>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: productData.id,
            );
          },
          child: Image.network(
            "${productData.imageUrl}",
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: IconButton(
            icon: (productData.isFavorite) ? Icon(Icon.favorite) : Icon(Icon.favorite_border_outline),
            color: Theme.of(context).colorScheme.secondary,
            onPressed: () {
              productData.statusFav();
            },
          ),
          title: Text(
            "${productData.title}",
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.shopping_cart,
            ),
            onPressed:() {},
            color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
      );
    }
}
