import 'package:flutter/material.dart';
import 'package:verification_c4/verification.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Countrol4',
        home: Verificatoin());
  }
}
