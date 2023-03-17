import 'package:flutter/material.dart';
import 'package:flutter_practical_test/constant/const.dart';
import 'package:cached_network_image/cached_network_image.dart';

class RoundedImage extends StatelessWidget {
  final String imageUrl;
  final double? widthHeight;
  const RoundedImage({super.key, required this.imageUrl, this.widthHeight});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widthHeight ?? 50,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Const.borderRadius)),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        progressIndicatorBuilder: (context, url, progress) => Center(
          child: CircularProgressIndicator(
            value: progress.downloaded.toDouble(),
          ),
        ),
        fit: BoxFit.cover,
      ),
    );
  }
}
