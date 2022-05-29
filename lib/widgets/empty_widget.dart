import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';

class EmptyWidget extends StatelessWidget {
  final String text;
  const EmptyWidget(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(text),
          SizedBox(
            height: 20.0,
          ),
          Lottie.network(
              'https://assets9.lottiefiles.com/temp/lf20_Celp8h.json')
        ],
      ),
    );
  }
}
