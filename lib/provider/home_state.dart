import 'package:flutter/material.dart';
import 'package:flutter_practical_test/api/image_item_request.dart';
import 'package:flutter_practical_test/model/image_item_model.dart';

class HomeState extends ChangeNotifier {
  bool isLoading = false;
  String loadingText = "";
  bool status = false;

  List<ImageItemModel> imageModelList = [];
  ImageItemRequest request = ImageItemRequest();

  void onLoading(bool isLoading) {
    this.isLoading = isLoading;
    notifyListeners();
  }

  void fetchListImage() async {
    loadingText = "Fetching data";
    onLoading(true);
    List<ImageItemModel> data = [];
    data = await request.getListImageItem();
    if (data != null) {
      imageModelList = data;
      status = true;
    } else {
      status = false;
    }
    onLoading(false);
  }

  void refreshList() async {
    loadingText = "Refreshing data";
    ;
    onLoading(true);
    List<ImageItemModel> data = [];
    data = await request.getListImageItem();
    if (data != null) {
      imageModelList = data;
      status = true;
    } else {
      status = false;
    }
    onLoading(false);
  }

  HomeState() {
    fetchListImage();
  }
}
