import 'package:flutter/material.dart';
import 'package:netflix_clone/presentation/home/cubit/home_cubit.dart';
import 'package:netflix_clone/utils/color_palette.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar();

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  double opacity = 0;

  @override
  Widget build(BuildContext context) {
    final _bloc = context.read<HomeCubit>();

    _bloc.scrollController.addListener(() {
      if (_bloc.scrollController.position.pixels >= 30.0 && opacity == 0) {
        setState(() {
          opacity = 1;
        });
      } else if (_bloc.scrollController.position.pixels < 30.0 &&
          opacity == 1) {
        setState(() {
          opacity = 0;
        });
      }
    });

    return Stack(
      children: [
        AnimatedOpacity(
          duration: Duration(milliseconds: 200),
          opacity: opacity,
          child: Container(
            height: 90,
            color: ColorPalette.kBlack,
            padding: EdgeInsets.symmetric(horizontal: 20),
          ),
        ),
        SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('FLUTTERFLIX', style: Theme.of(context).textTheme.headline1,),
                CircleAvatar(
                  backgroundColor: ColorPalette.kGrey,
                  child: Icon(
                    Icons.person,
                    color: ColorPalette.kBlack,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
