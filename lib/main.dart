import 'package:eatbits_app/app/pages/auth_widget.dart';
import 'package:eatbits_app/app/pages/providers.dart';
import 'package:eatbits_app/app/pages/sign_in_page.dart';
import 'package:eatbits_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/pages/admin/admin_page.dart';
import 'app/pages/user/user_home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: AuthWidget(
            adminSignedInBulder: (context) => const AdminHome(),
            signedInBuilder: (context) => UserHomePage(),
            nonsignedInBuilder: (context) => const SignInPage()));
  }
}
