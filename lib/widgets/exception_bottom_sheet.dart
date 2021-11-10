import 'package:flutter/material.dart';

import 'package:netflix_clone/utils/color_palette.dart';

class ExceptionBottomSheet extends StatelessWidget {
  final String error;
  final VoidCallback onTap;
  const ExceptionBottomSheet({
    required this.error,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
        color: ColorPalette.kDarkGrey,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            error,
            style: Theme.of(context).textTheme.bodyText1,
            textAlign: TextAlign.center,
          ),
          _Button(onTap),
        ],
      ),
    );
  }
}

class _Button extends StatelessWidget {
  final VoidCallback onTap;
  const _Button(this.onTap);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(
          ColorPalette.kGrey.withOpacity(0.1),
        ),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        width: double.maxFinite,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: ColorPalette.kRed,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          'Tentar Novamente',
          style: Theme.of(context).textTheme.button,
        ),
      ),
    );
  }
}
