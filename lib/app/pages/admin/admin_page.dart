import 'package:eatbits_app/app/pages/admin_add_product_page.dart';
import 'package:eatbits_app/app/pages/providers.dart';
import 'package:eatbits_app/models/product.dart';
import 'package:eatbits_app/widgets/snackbars.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

import '../../../widgets/project_list_tile.dart';

class AdminHome extends ConsumerWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: const Text('Admin Home'),
          actions: [
            IconButton(
                onPressed: () => ref.read(firebaseAuthProvider).signOut(),
                icon: const Icon(Icons.logout))
          ],
        ),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add, color: Colors.white),
            onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => AdminAddProductPage()))),
        body: StreamBuilder<List<Product>>(
          stream: ref.read(databaseProvider)!.getBurgers(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active &&
                snapshot.data != null) {
              if (snapshot.data!.isEmpty) {
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Lottie.network("https://lottiefiles.com/5081-empty-box",
                          width: 200, repeat: false),
                      const Text('No Products available')
                    ],
                  ),
                );
              }
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (c, i) {
                  final burgerData = snapshot.data![i];
                  return Padding(
                      padding: EdgeInsets.all(8.5),
                      child: ProductListTile(
                        product: burgerData,
                        onDelete: () async {
                          openIconSnackBar(context, 'deleting burger .....',
                              const Icon(Icons.delete));
                          await ref
                              .read(databaseProvider)!
                              .deleteBurger(burgerData.prodId!);
                        },
                        onPressed: () {},
                      ));
                },
              );
            }
            return const CircularProgressIndicator();
          },
        ));
  }
}
