import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/product.dart';

class BurgerDetails extends ConsumerWidget {
  final Product burger;

  const BurgerDetails({Key? key, required this.burger}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  size: 30.0,
                )),
            Row(
              children: [
                Flexible(
                  flex: 5,
                  fit: FlexFit.loose,
                  child: Image.network(
                    burger.imageUrl,
                    height: 200,
                  ),
                ),
                Flexible(
                    flex: 5,
                    child: Column(
                      children: [],
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
