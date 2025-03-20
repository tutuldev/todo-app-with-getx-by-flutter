

import 'package:get/get.dart';
import 'package:statemannagement_with_getx/app/features/authentication/controller/login_controller.dart';
import 'package:statemannagement_with_getx/app/features/authentication/controller/signup_controller.dart';

class LoginBindings extends Bindings{
  @override
  void dependencies() {
    // Get.lazyPut(()=>LoginBindings());
    Get.lazyPut(()=>LoginController());
    Get.lazyPut(()=>SignupController());
  }

}

