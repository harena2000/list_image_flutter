import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_practical_test/api/base_request.dart';
import 'package:flutter_practical_test/model/image_item_model.dart';

class ImageItemRequest {
  final baseApi = BaseApiRequest();

  Future<List<ImageItemModel>> getListImageItem() async {
    try {
      Response response = await baseApi.dio().then((method) => method.get(""));
      return (response.data as List)
          .map((e) => ImageItemModel.fromJson(e))
          .toList();
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }
}
