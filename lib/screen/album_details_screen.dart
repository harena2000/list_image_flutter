import 'package:flutter/material.dart';
import 'package:flutter_practical_test/component/custom_list_tile.dart';
import 'package:flutter_practical_test/component/rounded_image.dart';
import 'package:flutter_practical_test/model/image_item_model.dart';
import 'package:flutter_practical_test/screen/details_screen.dart';

class AlbumDetailsScreen extends StatefulWidget {
  final List<ImageItemModel> imageListModel;
  final int albumId;

  const AlbumDetailsScreen(
      {super.key, required this.imageListModel, required this.albumId});

  @override
  State<AlbumDetailsScreen> createState() => _AlbumDetailsScreenState();
}

class _AlbumDetailsScreenState extends State<AlbumDetailsScreen> {
  void navigate(ImageItemModel imageItemModel) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => DetailsScreen(model: imageItemModel)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Album ${widget.albumId}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Expanded(
          child: ListView.builder(
            itemCount: widget.imageListModel.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  navigate(widget.imageListModel[index]);
                },
                child: SizedBox(
                  height: 80,
                  child: CustomListTile(
                    leadingImage: RoundedImage(
                      imageUrl: widget.imageListModel[index].thumbnailUrl!,
                      widthHeight: 200,
                    ),
                    title: widget.imageListModel[index].title!,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
