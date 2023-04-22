import 'package:flutter/material.dart';
import 'package:responsive/cardapio.dart';
import 'package:responsive/components/food_item.dart';

class FoodMenu extends StatefulWidget {
  const FoodMenu({super.key});

  @override
  State<FoodMenu> createState() => _FoodMenuState();
}

class _FoodMenuState extends State<FoodMenu> {
  final List items = comidas;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: Text(
                'Menu',
                style: TextStyle(
                  fontFamily: 'Caveat',
                  fontSize: 32,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return FoodItem(
                imageURI: items[index]['image'],
                itemTitle: items[index]['name'],
                itemPrice: items[index]['price'],
              );
            }, childCount: items.length),
          )
        ],
      ),
    );
  }
}
