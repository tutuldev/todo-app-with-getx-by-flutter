import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:statemannagement_with_getx/app/general/routes/app_pages.dart';
import 'package:get_storage/get_storage.dart';

void main() async{
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
         
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: AppPages.initialRoute,
      getPages:AppPages.routes,
    );
  }
}
