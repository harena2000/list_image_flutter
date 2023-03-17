import 'package:dio/dio.dart';

class BaseApiRequest {
  Dio api = Dio();
  String baseUrl = "https://jsonplaceholder.typicode.com/photos";

  Future<Dio> dio() async {
    Dio dio = Dio();

    dio.options.baseUrl = baseUrl;
    dio.options.headers['Accept-Encoding'] = "gzip, deflate, br";
    dio.options.headers['Connection'] = "keep-alive";
    dio.options.headers['Accept'] = "application/json";

    return dio;
  }
}
