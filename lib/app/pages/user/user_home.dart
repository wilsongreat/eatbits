import 'package:eatbits_app/models/product.dart';
import 'package:eatbits_app/widgets/product_display.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../widgets/empty_widget.dart';
import '../providers.dart';

class UserHomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(actions: [
          IconButton(
              onPressed: () => ref.read(firebaseAuthProvider).signOut(),
              icon: const Icon(Icons.logout))
        ]),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Hi Wilson',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Welcome to burger Planet',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Container(
                        height: 50,
                        width: size.width / 1.1,
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: TextField(
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.search,
                                color: Colors.grey,
                                size: 25,
                              ),
                              hintText: 'find a burger',
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                color: Colors.grey.withOpacity(0.7),
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.italic,
                              )),
                        )),
                  ],
                ),
                const SizedBox(height: 10.0),
                Container(
                  // color: Colors.red,
                  height: size.height / 3.4,
                  width: size.width,
                  child: Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 20.0),
                        width: size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          image: const DecorationImage(
                              image: AssetImage(
                                'assets/img/kfc1.jpg',
                              ),
                              fit: BoxFit.cover),
                        ),
                      ),
                      const Positioned(
                          top: 0.0,
                          left: 40.0,
                          child: Image(
                            image: AssetImage('assets/img/kfc-logo1.png'),
                            height: 50.0,
                          )),
                      Positioned(
                          bottom: 0.0,
                          left: 23.0,
                          child: Container(
                            height: 100.0,
                            width: size.width / 1.2,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15.0),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withAlpha(10),
                                      offset: Offset(0.0, 0.1),
                                      blurRadius: 10,
                                      spreadRadius: 6)
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    height: 90.0,
                                    width: 60,
                                    decoration: BoxDecoration(
                                        image: const DecorationImage(
                                            image: AssetImage(
                                                'assets/img/kfc-logo1.png')),
                                        border: Border.all(
                                          width: 1,
                                          color: Colors.grey.withOpacity(0.1),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        const Text("KFC",
                                            style: TextStyle(
                                              letterSpacing: 1.5,
                                              fontSize: 15,
                                            )),
                                        Row(
                                          children: const [
                                            Icon(Icons.delivery_dining),
                                            Text("10mins"),
                                            SizedBox(
                                              width: 30.0,
                                            ),
                                          ],
                                        ),
                                      ]),
                                  const Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Padding(
                                      padding: EdgeInsets.only(bottom: 5.0),
                                      child: Text(
                                        "85 miles Away",
                                        style:
                                            TextStyle(color: Colors.redAccent),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 5.0),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 8.0),
                                        child: Row(
                                          children: const [
                                            Icon(
                                              Icons.location_on,
                                              color: Colors.red,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text('Irona'),
                                          ],
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(bottom: 5.0),
                                        child: Text("⭐  4.0"),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Menu',
                  style: Theme.of(context).textTheme.headline5,
                ),
                const Expanded(
                  child: ProductDisplay(),
                )
              ],
            ),
          ),
        ));
  }
}
