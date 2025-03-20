import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class BaseClient {
  static Future<BaseOptions> getBaseOptions() async {
    final storage = GetStorage();
    BaseOptions options = BaseOptions(
      followRedirects: false,
      validateStatus: (status) {
        return status! < 500;
      },
      headers: {
        "Accept": "application/json",
        'Content-type': 'application/json',
        'X-Requested-With': 'XMLHttpRequest',
        'Authorization': 'Bearer ${storage.read("token")}',
      },
    );
    return options;
  }

  static Future<dynamic> get({required String url, var payload}) async {
    var dio = Dio(await getBaseOptions());
    var response = await dio.get(url, queryParameters: payload);
    return response;
  }

  static Future<dynamic> post({required String url, var payload}) async {
    var dio = Dio(await getBaseOptions());
    var response = await dio.post(url, data: payload);
    return response;
  }

  static Future<dynamic> postWithQP({required String url, var queryPayload}) async {
    var dio = Dio(await getBaseOptions());
    var response = await dio.post(url, queryParameters: queryPayload);
    return response;
  }

  static Future<dynamic> put({required String url, var payload}) async {
    var dio = Dio(await getBaseOptions());
    var response = await dio.put(url, data: payload);
    return response;
  }

  static Future<dynamic> delete({required String url}) async {
    var dio = Dio(await getBaseOptions());
    var response = await dio.delete(url);
    return response;
  }
}
