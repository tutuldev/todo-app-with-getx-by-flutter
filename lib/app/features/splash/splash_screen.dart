import 'package:flutter/material.dart';
import 'package:statemannagement_with_getx/app/general/routes/app_routes.dart';
import 'package:get/get.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  @override
  void initState() {
    super.initState();
    navigateTo();
  }
  
  void navigateTo()async{
    await Future.delayed(const Duration(seconds: 2)).then((_){
      Get.toNamed(AppRoutes.intro);
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Image.asset('images/logo.png'),
      ),
    );
  }
}