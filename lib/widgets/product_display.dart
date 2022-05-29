import 'package:eatbits_app/app/pages/user/burger_details.dart';
import 'package:eatbits_app/extensions/string_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app/pages/providers.dart';
import '../models/product.dart';
import 'empty_widget.dart';

class ProductDisplay extends ConsumerWidget {
  const ProductDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    return StreamBuilder<List<Product>>(
        stream: ref.read(databaseProvider)!.getBurgers(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active &&
              snapshot.data != null) {
            if (snapshot.data!.isEmpty) {
              return EmptyWidget('Burgers not available');
            }
          }
          return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, i) {
                final burger = snapshot.data![i];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => BurgerDetails(burger: burger)));
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    height: 80,
                    width: size.width,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(.1),
                        borderRadius: BorderRadius.circular(15.0)),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Flexible(
                              flex: 5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    burger.name.capitalize(),
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontSize: 17.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Text('Available',
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey)),
                                  Row(
                                    // mainAxisAlignment:
                                    //     MainAxisAlignment
                                    //         .spaceBetween,
                                    children: [
                                      Text('\$${burger.price.toString()}',
                                          style: const TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red)),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      const Text("⭐  4.0"),
                                    ],
                                  ),
                                ],
                              )),
                          Flexible(
                              flex: 5,
                              child: Container(
                                alignment: Alignment.centerRight,
                                child: Image.network(burger.imageUrl),
                              ))
                        ],
                      ),
                    ),
                  ),
                );
              });
        }));
  }
}
