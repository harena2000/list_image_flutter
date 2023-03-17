class ImageItemModel {
  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl = "";

  ImageItemModel(
      {this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  ImageItemModel.fromJson(Map<String, dynamic> json) {
    albumId = json['albumId'];
    id = json['id'];
    title = json['title'];
    url = json['url'];
    thumbnailUrl = json['thumbnailUrl'];
  }
}
