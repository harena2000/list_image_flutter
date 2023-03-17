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
                background: Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30))),
                    child: CachedNetworkImage(
                      imageUrl: widget.model.url!,
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      ),
                      fit: BoxFit.cover,
                    ))),
            pinned: true,
            expandedHeight: MediaQuery.of(context).size.height * 0.305,
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RoundedImage(
                          imageUrl: widget.model.thumbnailUrl!,
                          widthHeight: 100,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  widget.model.title!,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                  softWrap: true,
                                  overflow: TextOverflow.fade,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "url : ${widget.model.url!}",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w200),
                                softWrap: true,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "ALBUM : ${widget.model.albumId!}",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w200),
                          softWrap: true,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "ID : ${widget.model.id!}",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w200),
                          softWrap: true,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "IMAGE : ${widget.model.url!}",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w200),
                          softWrap: true,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "THUMBNAIL : ${widget.model.thumbnailUrl!}",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w200),
                          softWrap: true,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ]))
        ],
      ),
    );
  }
}
