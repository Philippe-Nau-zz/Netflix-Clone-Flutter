import 'package:flutter/material.dart';
import 'package:netflix_clone/utils/network_addres.dart';

class CardPoster extends StatelessWidget {
  final String urlImage;
  const CardPoster({required this.urlImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 240,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            '${NetworkAddres.kNetflixImgRow}$urlImage',
          ),
        ),
      ),
    );
  }
}
