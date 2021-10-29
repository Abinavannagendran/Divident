// ignore: import_of_legacy_library_into_null_safe
import 'package:divident/DividentController.dart';
import 'package:divident/divident.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DividentController()),
      ],
      child: new MaterialApp(
          title: 'Cart',
          debugShowCheckedModeBanner: true,
          home: new Divident()),
    );
  }
}
