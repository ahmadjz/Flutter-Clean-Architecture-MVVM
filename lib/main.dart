import 'package:api_mvvm/app/app.dart';
import 'package:api_mvvm/app/di.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();
  runApp(const MyApp());
}
