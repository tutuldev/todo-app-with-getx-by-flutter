import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:statemannagement_with_getx/app/features/authentication/model/login_mode.dart';
import 'package:dio/dio.dart' as dio;
import 'package:statemannagement_with_getx/app/general/api/base_client.dart';
import 'package:statemannagement_with_getx/app/general/constants/urls.dart';

class LoginRepo {
  Future<LoginModel> login(String email, String password) async {
    try {
      // API কল করা
      dio.Response resresponse = await BaseClient.post(
        url: Urls.login,
        payload: {
          'email': email,
          'password': password,
        },
      );

      // স্ট্যাটাস কোড ২০০ - সফল লগইন
      if (resresponse.statusCode == 200) {
        LoginModel loginModel = LoginModel.fromJson(resresponse.data);
        return loginModel;
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
