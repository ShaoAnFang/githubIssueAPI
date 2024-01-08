import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: (context, child) => MediaQuery(data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)), child: child!),
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.initPage,
      getPages: AppPages.routes,
      defaultTransition: Transition.cupertino,
      enableLog: true,
      // home: MainPage(),
    );
  }
}
