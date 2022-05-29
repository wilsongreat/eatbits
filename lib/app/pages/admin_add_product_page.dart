import 'dart:io';

import 'package:eatbits_app/app/pages/providers.dart';
import 'package:eatbits_app/models/product.dart';
import 'package:eatbits_app/widgets/snackbars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class AdminAddProductPage extends ConsumerStatefulWidget {
  // const AdminAddProductPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AdminAddProductPageState();
}

class _AdminAddProductPageState extends ConsumerState<AdminAddProductPage> {
  final titleTextController = TextEditingController();
  final priceEditingController = TextEditingController();
  final prepTimeEditingController = TextEditingController();
  final descriptionEditingController = TextEditingController();
  final deliveryTimeEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a burger'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            CustomInputFieldFb1(
                inputController: titleTextController,
                hintText: 'Burger name',
                labelText: 'Burger Name'),
            SizedBox(height: 15.0),
            CustomInputFieldFb1(
                inputController: priceEditingController,
                hintText: 'Burger Price',
                labelText: 'Burger price'),
            SizedBox(height: 15.0),
            CustomInputFieldFb1(
                inputController: prepTimeEditingController,
                hintText: 'Prep time',
                labelText: 'prep time'),
            SizedBox(height: 15.0),
            CustomInputFieldFb1(
                inputController: descriptionEditingController,
                hintText: 'Burger description',
                labelText: 'Burger description'),
            SizedBox(height: 15.0),
            CustomInputFieldFb1(
                inputController: deliveryTimeEditingController,
                hintText: 'delivery time',
                labelText: 'delivery time'),
            const Spacer(),
            Consumer(builder: (context, watch, child) {
              final image = ref.watch(addImageProvider);
              return image == null
                  ? const Text('No image selected')
                  : Image.file(
                      File(image.path),
                      height: 200,
                    );
            }),
            ElevatedButton(
                onPressed: () async {
                  final image = await ImagePicker()
                      .pickImage(source: ImageSource.gallery);
                  if (image != null) {
                    ref.watch(addImageProvider.state).state = image;
                  }
                },
                child: const Text('Upload  Image')),
            ElevatedButton(
                onPressed: () => _addBurger(), child: const Text('Add Burger')),
            SizedBox(height: 15.0),
          ],
        ),
      ),
    );
  }

  _addBurger() async {
    final storage = ref.read(databaseProvider);
    final burgerImage = ref.read(addImageProvider.state).state;
    final imgStorage = ref.read(storageProvider);
    if (storage == null || burgerImage == null || imgStorage == null) {
      return;
    }
    final imageUrl = await imgStorage.uploadFile(burgerImage.path);
//we are not storing image now  because we would prefer to store it at storage rather than firestore
    await storage.addBurger(Product(
        name: titleTextController.text,
        description: descriptionEditingController.text,
        prepTime: prepTimeEditingController.text,
        price: double.parse(priceEditingController.text),
        imageUrl: imageUrl,
        deliveryTime: deliveryTimeEditingController.text));
    Navigator.pop(context);
    openIconSnackBar(context, 'Product added successfully',
        const Icon(Icons.check, color: Colors.white));
  }
}

class CustomInputFieldFb1 extends StatelessWidget {
  final TextEditingController inputController;
  final String hintText;
  final Color primaryColor;
  final String labelText;

  const CustomInputFieldFb1(
      {Key? key,
      required this.inputController,
      required this.hintText,
      required this.labelText,
      this.primaryColor = Colors.indigo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            offset: const Offset(12, 26),
            blurRadius: 50,
            spreadRadius: 0,
            color: Colors.grey.withOpacity(.1)),
      ]),
      child: TextField(
        controller: inputController,
        onChanged: (value) {
          //Do something wi
        },
        keyboardType: TextInputType.emailAddress,
        style: const TextStyle(fontSize: 16, color: Colors.black),
        decoration: InputDecoration(
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey.withOpacity(.75)),
          fillColor: Colors.transparent,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
          border: UnderlineInputBorder(
            borderSide:
                BorderSide(color: primaryColor.withOpacity(.1), width: 2.0),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: primaryColor, width: 2.0),
          ),
          errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 2.0),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide:
                BorderSide(color: primaryColor.withOpacity(.1), width: 2.0),
          ),
        ),
      ),
    );
  }
}
