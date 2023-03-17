import 'package:flutter/material.dart';
import 'package:flutter_practical_test/api/image_item_request.dart';
import 'package:flutter_practical_test/model/image_item_model.dart';

class HomeState extends ChangeNotifier {
  bool isLoading = false;
  String loadingText = "";
  bool status = false;

  List<ImageItemModel> imageModelList = [];
  List<ImageItemModel> filteredList = [];

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
    }
    filteredList.addAll(imageModelList);
    onLoading(false);
  }

  void refreshList() async {
    loadingText = "Refreshing data";
    onLoading(true);
    List<ImageItemModel> data = [];
    data = await request.getListImageItem();
    if (data != null) {
      imageModelList = data;
      status = true;
    } else {
      status = false;
    }
    filteredList.addAll(imageModelList);
    onLoading(false);
  }

  void filterItems(String query) {
    List<ImageItemModel> tempList = [];
    tempList.addAll(imageModelList);

    if (query.isNotEmpty) {
      List<ImageItemModel> searchList = [];
      tempList.forEach((element) {
        if (element.title!.toLowerCase().contains(query.toLowerCase())) {
          searchList.add(element);
        }
      });
      filteredList.clear();
      filteredList.addAll(searchList);
    } else {
      filteredList.clear();
      filteredList.addAll(imageModelList);
    }

    notifyListeners();
  }

  Future<bool> loadMore() async {
    await Future.delayed(const Duration(seconds: 0, milliseconds: 100));
    return true;
  }

  HomeState() {
    fetchListImage();
  }
}
