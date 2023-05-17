import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:github_api/routes/routes_generator.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GitHub Api',
      initialRoute: '/home',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          centerTitle: true,
          titleSpacing: 0,
          titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w700),
          iconTheme: IconThemeData(color: Colors.black)
        ),
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.black
      ),
      getPages: RoutesGenerator.routes,
    );
  }
}

