import 'package:flutter/material.dart';
import 'package:flutter_practical_test/component/rounded_image.dart';
import 'package:flutter_practical_test/model/image_item_model.dart';
import 'package:cached_network_image/cached_network_image.dart';

class DetailsScreen extends StatefulWidget {
  final ImageItemModel model;

  const DetailsScreen({super.key, required this.model});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        backgroundColor: Colors.blueGrey[900],
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              foregroundColor: Colors.white,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30))),
              flexibleSpace: FlexibleSpaceBar(
                  title: Text(
                    widget.model.url!,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  background: Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30))),
                      child: CachedNetworkImage(
                        imageUrl: widget.model.url!,
                        progressIndicatorBuilder: (context, url, progress) =>
                            Center(
                          child: CircularProgressIndicator(
                            value: progress.downloaded.toDouble(),
                          ),
                        ),
                        fit: BoxFit.cover,
                      ))),
              pinned: true,
              expandedHeight: MediaQuery.of(context).size.height * 0.305,
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              SizedBox(
                height: 200,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RoundedImage(
                      imageUrl: widget.model.thumbnailUrl!,
                      widthHeight: 200,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        Text(
                          widget.model.title!,
                          style: const TextStyle(color: Colors.white, fontSize: 18),
                          softWrap: true,
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ]))
          ],
        ),
      ),
    );
  }
}
