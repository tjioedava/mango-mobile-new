import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:mango_mobile/widgets/left_drawer.dart';
import 'package:mango_mobile/models/product.dart';
import 'package:mango_mobile/widgets/product_card.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
      ),
      drawer: const LeftDrawer(),
      body: ProductSection(),
    );
  }
}

class ProductSection extends StatefulWidget {
  const ProductSection({super.key});

  @override
  State<ProductSection> createState() => _ProductSectionState();
}

class _ProductSectionState extends State<ProductSection> {
  var _filterOwn = false;

  Future<List<Product>> fetchProduct(CookieRequest request) async {
    final response = await request
        .get('http://127.0.0.1:8000/show-products?own=$_filterOwn');

    // Melakukan decode response menjadi bentuk json
    var data = response;

    // Melakukan konversi data json menjadi object Product
    List<Product> listProduct = [];
    for (var d in data) {
      if (d != null) {
        listProduct.add(Product.fromJson(d));
      }
    }
    return listProduct;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Column(children: [
      Column(children: [
        const Text("Filter to owned products"),
        Switch(
            value: _filterOwn,
            onChanged: (value) {
              setState(() {
                _filterOwn = value;
              });
            }),
      ]),
      Expanded(
        child: FutureBuilder(
          future: fetchProduct(request),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (!snapshot.hasData) {
                return const Column(
                  children: [
                    Text(
                      'This user has no product yet.',
                      style: TextStyle(fontSize: 20, color: Color(0xff59A5D8)),
                    ),
                    SizedBox(height: 8),
                  ],
                );
              } else {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) =>
                        ProductCard(product: snapshot.data![index]));
              }
            }
          },
        ),
      ),
    ]);
  }
}
