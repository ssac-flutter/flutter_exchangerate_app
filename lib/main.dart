import 'package:flutter/material.dart';
import 'package:flutter_exchangerate_app/main_screen.dart';
import 'package:provider/provider.dart';

import 'exchangerate/components/exchangerate_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        create: (_) => ExchangerateViewModel(),
        child: const MainScreen(),
      ),
    );
  }
}
