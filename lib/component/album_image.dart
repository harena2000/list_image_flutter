import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practical_test/constant/const.dart';

class AlbumImage extends StatelessWidget {
  final String image1;
  final String image2;
  final String image3;
  const AlbumImage(
      {super.key,
      required this.image1,
      required this.image2,
      required this.image3});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 100,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 1),
          color: Colors.black.withOpacity(0.5),
          borderRadius: BorderRadius.circular(Const.borderRadius)),
      child: Row(
        children: [
          SizedBox(
            width: 45,
            child: CachedNetworkImage(
              imageUrl: image1,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
              child: Column(
            children: [
              SizedBox(
                height: 40,
                child: CachedNetworkImage(
                  imageUrl: image2,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Expanded(
                child: CachedNetworkImage(
                  imageUrl: image3,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
