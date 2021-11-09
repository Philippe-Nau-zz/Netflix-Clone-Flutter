import 'package:flutter/material.dart';
import 'package:netflix_clone/utils/color_palette.dart';

class FeaturedDetail extends StatelessWidget {
  final double height;
  final String urlImage;
  const FeaturedDetail({
    required this.height,
    required this.urlImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            urlImage,
          ),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            stops: [0.2, 1],
            colors: [
              ColorPalette.kBlack,
              ColorPalette.kTransparent,
            ],
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: [0.2, 1],
              colors: [
                ColorPalette.kBlack,
                ColorPalette.kTransparent,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
