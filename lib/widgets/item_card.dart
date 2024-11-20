import 'package:flutter/material.dart';
import 'package:mango_mobile/screens/add_product.dart';
import 'package:mango_mobile/screens/product_list.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:mango_mobile/screens/login.dart';

class ItemCardInfo {
  final String name;
  final IconData icon;
  final Color color;

  ItemCardInfo(this.name, this.icon, this.color);
}

class ItemCard extends StatelessWidget {
  final ItemCardInfo item;

  const ItemCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    CookieRequest request = context.watch<CookieRequest>();

    return Material(
      color: item.color,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () async {
          if (item.name == "Add a Product") {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddProductPage(),
                ));
          } else if (item.name == "Show Products") {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProductPage(),
                ));
          } else if (item.name == "Logout") {
            final response = await request
                .logout("http://127.0.0.1:8000/authenticate/logout/");
            String message = response["message"];
            if (context.mounted) {
              if (response['status']) {
                String uname = response["username"];
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("$message Sampai jumpa, $uname."),
                ));
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(message),
                  ),
                );
              }
            }
          }
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
