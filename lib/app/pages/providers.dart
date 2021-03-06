import 'package:eatbits_app/services/firestore_service.dart';
import 'package:eatbits_app/services/storage_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final firebaseAuthProvider = Provider<FirebaseAuth>(
  (ref) => FirebaseAuth.instance,
);

final authStateChangesProvider = StreamProvider<User?>(
  (ref) {
    return ref.watch(firebaseAuthProvider).authStateChanges();
  },
);

final databaseProvider = Provider<FirestoreService?>(
  (ref) {
    final auth = ref.watch(authStateChangesProvider);
    String? uid = auth.asData?.value?.uid;
    if (uid != null) {
      return FirestoreService(uid: uid);
    }
    return null;
  },
);

final addImageProvider = StateProvider<XFile?>((_) => null);

final storageProvider = Provider<StorageService?>(
  (ref) {
    final auth = ref.watch(authStateChangesProvider);
    String? uid = auth.asData?.value?.uid;
    if (uid != null) {
      return StorageService(uid: uid);
    }
    return null;
  },
);
