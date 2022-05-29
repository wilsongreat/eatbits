import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/product.dart';

class FirestoreService {
  final String uid;

  FirestoreService({required this.uid});

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> addBurger(Product product) async {
    final docId = firestore.collection('products').doc().id;
    await firestore
        .collection('products')
        .add(product.toMap(docId))
        .then((value) => print(value))
        .catchError((error) => print("Error"));
  }

  Stream<List<Product>> getBurgers() {
    return firestore
        .collection('products')
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) {
              final d = doc.data();
              return Product.fromMap(d);
            }).toList());
  }

  Future<void> deleteBurger(String id) async {
    await firestore.collection('products').doc(id).delete();
  }
}
