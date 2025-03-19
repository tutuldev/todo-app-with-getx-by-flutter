import 'package:flutter/material.dart';
import 'package:statemannagement_with_getx/app/general/constants/stye.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final height= MediaQuery.of(context).size.height;
    final width= MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFF212832),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             const SizedBox(height: 20),
              Image.asset('images/logo2.png',height: height * 0.15,width: width,),
              const SizedBox(height: 32),
              const   Text("welcome back !",style: titleTextStyle,),
              const SizedBox(height: 20),
              Form(child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                const  Text("Email Address",style: labelTextStyle,),
                const SizedBox(height: 20),
                  TextFormField(
                     style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: const InputDecoration(
                      // prefix: Icon(Icons.person_2_outlined,color: Colors.white,),
                      prefixIcon: Icon(Icons.person_2_outlined),
                      prefixIconColor:Colors.white ,
                      hintText: "example@gmail.com",
                      hintStyle: TextStyle(
                        color: Colors.white,
                      ),
                      fillColor: Color(0xFF8CAAB9),
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.only(left: 8),
                    ),
                  ),
                  const SizedBox(height: 20),
                const  Text("Password",style: labelTextStyle,),
                const SizedBox(height: 20),
                
                  TextFormField(
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
                      fillColor: Color(0xFF8CAAB9),
                      border: OutlineInputBorder(),
                      // contentPadding: EdgeInsets.only(left: 8),
                    ),
                  ),
                ],
              )),
              const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0XFFFED36A),
                    minimumSize: Size(double.infinity, height * 0.08), // Set width to infinity
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text("Log In"),
                ),

              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an acount?", style: labelTextStyle,),
                  TextButton(onPressed: (){}, child: const Text("SignUp"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
