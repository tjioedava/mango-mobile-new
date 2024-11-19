import 'package:flutter/material.dart';
import 'package:myapp/widgets/item_card.dart';
import 'package:myapp/widgets/left_drawer.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final List<ItemCardInfo> items = [
    ItemCardInfo(
        "Show Products", Icons.laptop, const Color.fromRGBO(73, 1, 84, 1)),
    ItemCardInfo(
        "Add a Product", Icons.add, const Color.fromRGBO(0, 12, 139, 1)),
    ItemCardInfo("Logout", Icons.logout, const Color.fromRGBO(2, 132, 132, 1)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Mango E-Commerce"),
        ),
        drawer: const LeftDrawer(),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            GridView.count(
              primary: true,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 3,
              shrinkWrap: true,
              children: items.map((ItemCardInfo item) {
                return ItemCard(item);
              }).toList(),
            ),
          ]),
        ));
  }
}
