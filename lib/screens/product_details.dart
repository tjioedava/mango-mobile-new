import 'package:flutter/material.dart';
import 'package:mango_mobile/models/product.dart';
import 'package:mango_mobile/widgets/left_drawer.dart';

class ProductDetailsPage extends StatelessWidget {
  final Product _product;

  const ProductDetailsPage({super.key, required Product product})
      : _product = product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_product.fields.name)),
      drawer: const LeftDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Inner padding for the card
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _product.fields.name,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.location_on, size: 14, color: Colors.grey),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    "Price: ${_product.fields.price}",
                    style: const TextStyle(fontSize: 12.0, color: Colors.grey),
                    overflow: TextOverflow.ellipsis, // Handles long text
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.book, size: 14, color: Colors.grey),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    "Description: ${_product.fields.description}",
                    style: const TextStyle(fontSize: 12.0, color: Colors.grey),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.shopping_bag, size: 14, color: Colors.grey),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    "Items Purchased: ${_product.fields.itemsPurchased}",
                    style: const TextStyle(fontSize: 12.0, color: Colors.blue),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.star, size: 14, color: Colors.grey),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    "Ratings: ${_product.fields.rating}",
                    style: const TextStyle(fontSize: 12.0, color: Colors.blue),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              child: const Icon(Icons.arrow_back_rounded, color: Colors.black),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
