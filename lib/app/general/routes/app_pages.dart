

import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:statemannagement_with_getx/app/features/authentication/bindings/login_bindings.dart';
import 'package:statemannagement_with_getx/app/features/authentication/screen/login_screen.dart';
import 'package:statemannagement_with_getx/app/features/authentication/screen/signup_screen.dart';
import 'package:statemannagement_with_getx/app/features/home/screens/home_screen.dart';
import 'package:statemannagement_with_getx/app/features/intro/intro_screen.dart';
import 'package:statemannagement_with_getx/app/features/splash/splash_screen.dart';
import 'app_routes.dart';

class AppPages {
  static const initialRoute = '/';

  static final routes = [
    GetPage(
      name: initialRoute, 
      page: ()=> const SplashScreen()
      ),
    GetPage(
      name: AppRoutes.intro, 
      page: ()=> const IntroScreen()
      ),
    GetPage(
      name: AppRoutes.home, 
      page: ()=> const HomeScreen()
      ), GetPage(
      name: AppRoutes.logIn,
      page: ()=>  LoginScreen(),
      binding: LoginBindings(),
      ), GetPage(
      name: AppRoutes.signUp,
      page: ()=> const SignupScreen()
      ),
  ];
}