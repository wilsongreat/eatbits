import 'package:eatbits_app/app/pages/providers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthWidget extends ConsumerWidget {
  final WidgetBuilder signedInBuilder;
  final WidgetBuilder nonsignedInBuilder;
  final WidgetBuilder adminSignedInBulder;

  const AuthWidget(
      {required this.signedInBuilder,
      required this.nonsignedInBuilder,
      required this.adminSignedInBulder});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authStateChanges = ref.watch(authStateChangesProvider);
    // TODO: implement build
    String adminEmail = 'admin@admin.com';
    return authStateChanges.when(
        data: (user) => user != null
            ? user.email == adminEmail
                ? adminSignedInBulder(context)
                : signedInBuilder(context)
            : nonsignedInBuilder(context),
        error: (_, __) => const Scaffold(
              body: Center(
                child: Text("something went wrong!!"),
              ),
            ),
        loading: () => const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ));
  }
}
