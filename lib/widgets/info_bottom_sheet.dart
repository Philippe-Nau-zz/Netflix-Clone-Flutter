import 'package:flutter/material.dart';
import 'package:netflix_clone/utils/color_palette.dart';

class InfoBottomSheet extends StatelessWidget {
  const InfoBottomSheet();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        color: ColorPalette.kDarkGrey,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Center(
        child: SizedBox(
          height: 70,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Feito por Philippe N. Rosa',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Text(
                'Direitos de imagem para Netflix',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Text(
                'Dados pegos do site themoviedb.org',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
