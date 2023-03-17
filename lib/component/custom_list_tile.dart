import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final Widget leadingImage;
  final String title;
  const CustomListTile(
      {super.key, required this.leadingImage, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            leadingImage,
            const SizedBox(
              width: 10,
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                title,
                style: const TextStyle(color: Colors.white),
                softWrap: true,
                overflow: TextOverflow.fade,
              ),
            ))
          ],
        ),
      ),
    );
  }
}
