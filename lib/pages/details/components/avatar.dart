import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final String imgUrl;
  const Avatar({Key? key, required this.imgUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.black, width: 3)
      ),
      child: ClipOval(
        child: CachedNetworkImage(
          height: 150,
          width: 150,
          imageUrl: imgUrl,
          placeholder: (context, url) => Image.asset('assets/loading.gif'),
          fit: BoxFit.contain,
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
