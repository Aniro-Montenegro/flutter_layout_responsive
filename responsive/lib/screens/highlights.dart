import 'package:flutter/material.dart';
import 'package:responsive/cardapio.dart';
import 'package:responsive/components/highlight_item.dart';

class HighLights extends StatelessWidget {
  const HighLights({super.key});
  final List items = destaques;

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
                'Destaques',
                style: TextStyle(
                  fontFamily: 'Caveat',
                  fontSize: 32,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          MediaQuery.of(context).orientation == Orientation.landscape ? const _landscapelist() : const _portraitList()
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class _portraitList extends StatelessWidget {
  const _portraitList();
  final List items = destaques;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return HighlightItem(
          imageURI: items[index]["image"],
          itemTitle: items[index]["name"],
          itemPrice: items[index]["price"],
          itemDescription: items[index]["description"],
        );
      }, childCount: items.length),
    );
  }
}

// ignore: camel_case_types
class _landscapelist extends StatelessWidget {
  const _landscapelist();
  final List items = destaques;
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return HighlightItem(
              imageURI: items[index]["image"],
              itemTitle: items[index]["name"],
              itemPrice: items[index]["price"],
              itemDescription: items[index]["description"],
            );
          },
          childCount: items.length,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 1.2,
        ));
  }
}
