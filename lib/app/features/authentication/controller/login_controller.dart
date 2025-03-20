

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:statemannagement_with_getx/app/features/authentication/repository/login_repo.dart';
import 'package:statemannagement_with_getx/app/general/routes/app_routes.dart';

class LoginController extends GetxController {

    var emailController = TextEditingController().obs;
    var passwordController = TextEditingController().obs;


  loginWithEmail() async {
    var response= await LoginRepo().login(emailController.value.text, passwordController.value.text);

    if(response.status == true){
      final box = GetStorage();
      box.write('token', response.token);
      Get.toNamed(AppRoutes.home);

      emailController.value.clear();
      passwordController.value.clear();

      Get.snackbar("Success", "Login Sucessfull");
    }else{
      Get.snackbar("Error", "Login Failed");
        
    }
  }
}