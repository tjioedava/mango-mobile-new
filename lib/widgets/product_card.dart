import 'package:flutter/material.dart';
import 'package:mango_mobile/models/product.dart';
import 'package:mango_mobile/screens/product_details.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4, // Elevation for the shadow effect
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // Rounded corners
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetailsPage(product: product)),
          );
        },
        borderRadius:
            BorderRadius.circular(10), // Same border radius as the card
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Inner padding for the card
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.fields.name,
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
                      "Price: ${product.fields.price}",
                      style:
                          const TextStyle(fontSize: 12.0, color: Colors.grey),
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
                      "Description: ${product.fields.description}",
                      style:
                          const TextStyle(fontSize: 12.0, color: Colors.grey),
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
                      "Items Purchased: ${product.fields.itemsPurchased}",
                      style:
                          const TextStyle(fontSize: 12.0, color: Colors.blue),
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
                      "Ratings: ${product.fields.rating}",
                      style:
                          const TextStyle(fontSize: 12.0, color: Colors.blue),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
