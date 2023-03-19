import 'package:flutter/material.dart';
import 'package:flutter_practical_test/api/image_item_request.dart';
import 'package:flutter_practical_test/model/image_item_model.dart';

class HomeState extends ChangeNotifier {
  bool isLoading = false;
  String loadingText = "";
  bool status = false;

  List<ImageItemModel> imageModelList = [];
  List<ImageItemModel> filteredList = [];
  Map<int, List<ImageItemModel>> albumList = {};
  List<int> albumId = [];

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
      getAlbumId();
      status = true;
    }
    filteredList.addAll(imageModelList);
    onLoading(false);
  }

  void getAlbumId() {
    for (var i = 0; i < imageModelList.length; i++) {
      if (!(albumId.contains(imageModelList[i].albumId))) {
        albumId.add(imageModelList[i].albumId!);
      }
    }
    createAlbumListById();
  }

  void createAlbumListById() {
    for (var i = 0; i < albumId.length; i++) {
      List<ImageItemModel> list = [];
      for (var j = 0; j < imageModelList.length; j++) {
        if (albumId[i] == imageModelList[j].albumId) {
          list.add(imageModelList[j]);
        }
        albumList.putIfAbsent(albumId[i], () => list);
      }
    }
  }

  Future<void> refreshList() async {
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

  HomeState() {
    fetchListImage();
  }
}
