import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SignInScreen(
      headerBuilder: (context, _, double) {
        return const Text(
          'EatBits\nAwaits!!.',
          style: TextStyle(
              color: Colors.grey, fontSize: 30.0, fontWeight: FontWeight.bold),
        );
      },
      providerConfigs: [
        const EmailProviderConfiguration(),
      ],
      footerBuilder: (context, _) {
        return const Text(
          'By signing in, you agree to our terms and conditions.',
          style: TextStyle(color: Colors.grey),
        );
      },
    );
  }
}
