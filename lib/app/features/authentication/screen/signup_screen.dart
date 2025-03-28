import 'package:flutter/material.dart';
import 'package:statemannagement_with_getx/app/features/authentication/controller/signup_controller.dart';
import 'package:statemannagement_with_getx/app/general/constants/stye.dart';
import 'package:get/get.dart';
import 'package:statemannagement_with_getx/app/general/routes/app_routes.dart';

class SignupScreen extends StatelessWidget {
   SignupScreen({super.key});

  final SignupController signupController =  Get.put(SignupController());
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
     final height= MediaQuery.of(context).size.height;
    final width= MediaQuery.of(context).size.width;
     return Scaffold(
      backgroundColor: const Color(0xFF212832),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
               const SizedBox(height: 20),
                Image.asset('images/logo2.png',height: height * 0.15,width: width,),
                const SizedBox(height: 32),
                const   Text("Create Your Account !",style: titleTextStyle,),
                const SizedBox(height: 20),
                Form(
                  key: formKey,
                  child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  const  Text("Full Name",style: labelTextStyle,),
                  const SizedBox(height: 20),
                    TextFormField(
                      controller: signupController.nameController.value,
                       style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: const InputDecoration(
                        // prefix: Icon(Icons.person_2_outlined,color: Colors.white,),
                        prefixIcon: Icon(Icons.person_2_outlined),
                        prefixIconColor:Colors.white ,
                        hintText: "Md Hasan",
                        hintStyle: TextStyle(
                          color: Colors.white,
                        ),
                       filled: true,
                       fillColor: Color(0XFF455A54),
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.only(left: 8),
                      ),
                        validator: (value){
                        
                       if(value!.isEmpty){
                          return "Field can't be empty";
                      }
                     
                      }
                    ),
                  const  Text("Email Address",style: labelTextStyle,),
                  const SizedBox(height: 20),
                    TextFormField(
                      // controller: SignupController().emailController.value,
                      controller: signupController.emailController.value,
                       style: const TextStyle(
                        color: Colors.white,
                      ),
                      decoration: const InputDecoration(
                        // prefix: Icon(Icons.person_2_outlined,color: Colors.white,),
                        prefixIcon: Icon(Icons.email_outlined),
                        prefixIconColor:Colors.white ,
                        hintText: "example@gmail.com",
                        hintStyle: TextStyle(
                          color: Colors.white,
                        ),
                       filled: true,
                       fillColor: Color(0XFF455A54),
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.only(left: 8),
                      ),
                         validator: (value){
                        
                       if(value!.isEmpty){
                          return "Field can't be empty";
                      }
                      if(value.isNotEmpty && !value.contains('@')){
                        return "Email is not valid";
                      }
                      }
                    ),
                    const SizedBox(height: 20),
                    const  Text("Password",style: labelTextStyle,),
                    const SizedBox(height: 20),
                  
                    TextFormField(
                      // controller: SignupController().passwordController.value,
                      controller: signupController.passwordController .value,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      obscureText: true,
                       decoration: const InputDecoration(
                        // prefix: Icon(Icons.lock,color: Colors.white,),
                        prefixIcon: Icon(Icons.lock),
                        prefixIconColor:Colors.white ,
                        // suffix: Icon(Icons.visibility),
                        suffixIcon: Icon(Icons.visibility),
                        suffixIconColor: Colors.white,
                        hintText: "password",
                        hintStyle: TextStyle(
                          color: Colors.white,
                        ),
                       filled: true,
                       fillColor: Color(0XFF455A54),
                        border: OutlineInputBorder(),
                        // contentPadding: EdgeInsets.only(left: 8),
                      ),
                         validator: (value){
                        
                       if(value!.isEmpty){
                          return "Password can't be empty";
                      }
                      if(value.isNotEmpty && value.length < 2){
                        return "Password must be at least 2 character";
                      }
                      }
                    ),
                    const SizedBox(height: 20),
                    const  Text("Confirm Password",style: labelTextStyle,),
                    const SizedBox(height: 20),
                  
                    TextFormField(
                      // controller: SignupController.ConfirmPassController.value,

                      style: TextStyle(
                        color: Colors.white,
                      ),
                      obscureText: true,
                       decoration: const InputDecoration(
                        // prefix: Icon(Icons.lock,color: Colors.white,),
                        prefixIcon: Icon(Icons.lock),
                        prefixIconColor:Colors.white ,
                        // suffix: Icon(Icons.visibility),
                        suffixIcon: Icon(Icons.visibility),
                        suffixIconColor: Colors.white,
                        hintText: "Confirm Password",
                        hintStyle: TextStyle(
                          color: Colors.white,
                        ),
                       filled: true,
                       fillColor: Color(0XFF455A54),
                        border: OutlineInputBorder(),
                        // contentPadding: EdgeInsets.only(left: 8),
                      ),
                      //    validator: (value){
                        
                      //  if(value!.isEmpty){
                      //     return "Password can't be empty";
                      // }
                      // if(value.isNotEmpty && value.length < 2 
                      // && singUpController.passwordController.value == ConfirmPassController.passwordController.value){
                      //   return "Password must be at least 2 character and match";
                      // }
                      // }
                     
                    ),
                  ],
                )),
                const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0XFFFED36A),
                      minimumSize: Size(double.infinity, 50), // Set width to infinity
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () async {
                          if(formKey.currentState!.validate()){
                        await signupController.signUp();

                      }
                    
                    },
                    child: const Text("Sign Up",style: TextStyle(color: Colors.black,fontSize: 20)),
                  ),
            
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an acount?", style: labelTextStyle,),
                    TextButton(onPressed: (){
                      Get.toNamed(AppRoutes.logIn);
                    }, child: const Text("LogIn",style: TextStyle(color: Colors.white)))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
