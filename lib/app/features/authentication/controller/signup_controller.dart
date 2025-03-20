
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:statemannagement_with_getx/app/features/authentication/repository/signup_repo.dart';
import 'package:statemannagement_with_getx/app/general/routes/app_routes.dart';

class SignupController extends GetxController {

    var nameController = TextEditingController().obs;
    var emailController = TextEditingController().obs;
    var passwordController = TextEditingController().obs;


  signUp() async {
    var response= await SignUpRepo().signUp(
      nameController.value.text,
      emailController.value.text,
      passwordController.value.text,
     );

    if(response.status == true){
      Get.toNamed(AppRoutes.logIn);

      nameController.value.clear();
      emailController.value.clear();
      passwordController.value.clear();

      Get.snackbar("Success", "Signup Sucessfull");
    }else{
      Get.snackbar("Error", "Signup Failed");
        
    }
  }
}