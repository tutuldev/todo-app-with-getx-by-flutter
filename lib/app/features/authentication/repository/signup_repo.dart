import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:statemannagement_with_getx/app/features/authentication/model/sign_up_model.dart';
import 'package:dio/dio.dart' as dio;
import 'package:statemannagement_with_getx/app/general/api/base_client.dart';
import 'package:statemannagement_with_getx/app/general/constants/urls.dart';

class SignUpRepo {
  Future<SignupModel> signUp(String name,String email, String password) async {

    Map<String,dynamic> data = {
      "name":name,
      "email":email,
      "password":password,
      // "name":"test name",
      // "email":"test@gmail.com",
      // "password":"123",
    };
    try {
      // API কল করা
      dio.Response resresponse = await BaseClient.post(
        url: Urls.signUp,
        payload: data,
      );
      // print(data.values);
      print("Sending data: ${data.toString()}");


      // স্ট্যাটাস কোড ২০০ - সফল লগইন
      if (resresponse.statusCode == 200) {
        SignupModel signupModel = SignupModel.fromJson(resresponse.data);
        return signupModel;
      } 
      // স্ট্যাটাস কোড ৪০১ - ভুল ইমেইল/পাসওয়ার্ড
      else if (resresponse.statusCode == 401) {
        Get.snackbar(
          "Authentication Error",
          "Invalid email or password. Please try again.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: const Color(0xFFE57373), // লাল ব্যাকগ্রাউন্ড
          colorText: const Color(0xFFFFFFFF), // সাদা টেক্সট
          duration: const Duration(seconds: 3),
        );
        throw Exception("Unauthorized: Invalid email or password.");
      } 
      // অন্য যেকোনো ইরর
      else {
        Get.snackbar(
          "Error",
          "Unexpected error occurred. Status code: ${resresponse.statusCode}",
          snackPosition: SnackPosition.TOP,
          backgroundColor: const Color(0xFF757575), // ধূসর ব্যাকগ্রাউন্ড
          colorText: const Color(0xFFFFFFFF),
          duration: const Duration(seconds: 3),
        );
        throw Exception("Unexpected error occurred with status code: ${resresponse.statusCode}");
      }
    } 
    // ক্যাচ ব্লক - সকল ইররের জন্য
    catch (e) {
      print("Error occurred: ${e.toString()}"); // ডেভেলপার লগ
      Get.snackbar(
        "Login Error",
        e.toString(),
        snackPosition: SnackPosition.TOP,
        backgroundColor: const Color(0xFFFFC107), // হলুদ ব্যাকগ্রাউন্ড
        colorText: const Color(0xFF000000), // কালো টেক্সট
        duration: const Duration(seconds: 3),
      );
      return Future.error("Login failed: ${e.toString()}");
    }
  }
}
