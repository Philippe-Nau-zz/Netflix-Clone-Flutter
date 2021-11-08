import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/data/model/result_model.dart';
import 'package:netflix_clone/presentation/home/cubit/home_cubit.dart';
import 'package:netflix_clone/presentation/home/widgets/movie_row.dart';
import 'package:netflix_clone/utils/color_palette.dart';
import 'package:netflix_clone/utils/network_addres.dart';

class HomeView extends StatelessWidget {
  const HomeView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          final _index = context.read<HomeCubit>().indexFeatured;
          print(_index);
          if (state is HomeLoadSucess) {
            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 350,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          '${NetworkAddres.kNetflixFeatured}${state.resultModel?[0].results?[_index].backdropPath}',
                        ),
                      ),
                    ),
                    child: Stack(
                      children: [
                        Container(
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
                        ),
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              stops: [0.1, 1],
                              colors: [
                                ColorPalette.kBlack,
                                ColorPalette.kTransparent,
                              ],
                            ),
                          ),
                        ),
                        SafeArea(
                          child: Container(
                            height: 55,
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'FLUTTERFLIX',
                                  style: TextStyle(
                                    color: ColorPalette.kRed,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 28,
                                  ),
                                ),
                                CircleAvatar(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 300,
                    child: ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.only(
                        top: 10,
                        bottom: 20,
                      ),
                      itemCount: state.resultModel?.length ?? 0,
                      itemBuilder: (context, index) => MovieRow(
                        result: state.resultModel?[index] ?? ResultModel.empty(),
                      ),
                      separatorBuilder: (context, index) => SizedBox(
                        height: 20,
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else if (state is HomeLoadInProgress) {
            return Center(
              child: CircularProgressIndicator(
                color: ColorPalette.kRed,
              ),
            );
          }
          return Center(
            child: Text('data'),
          );
        },
      ),
    );
  }
}
