import 'package:flutter/material.dart';

class CardMenu extends StatelessWidget {
  final String image;
  final String name;
  final String price;
  const CardMenu({super.key, required this.image, required this.name, required this.price});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      color: Theme.of(context).colorScheme.surfaceVariant,
      elevation: 0,
      child: Row(children: [
        Expanded(
          flex: 8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text(name), Text(price)],
          ),
        ),
        Expanded(
          flex: 2,
          child: SizedBox(
            height: double.infinity,
            child: Column(
              children: [
                Image(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
