import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/data/model/result_model.dart';
import 'package:netflix_clone/presentation/home/cubit/home_cubit.dart';
import 'package:netflix_clone/presentation/home/widgets/app_bar.dart';
import 'package:netflix_clone/presentation/home/widgets/featured_detail.dart';
import 'package:netflix_clone/presentation/home/widgets/movie_row.dart';
import 'package:netflix_clone/utils/color_palette.dart';
import 'package:netflix_clone/utils/network_addres.dart';
import 'package:netflix_clone/widgets/info_bottom_sheet.dart';

class HomeView extends StatelessWidget {
  const HomeView();

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final _bloc = context.read<HomeCubit>();

    return Scaffold(
      body: Stack(
        children: [
          RefreshIndicator(
            onRefresh: () => _bloc.fetchHomeItems(false),
            edgeOffset: 50,
            triggerMode: RefreshIndicatorTriggerMode.anywhere,
            backgroundColor: ColorPalette.kDarkGrey,
            color: ColorPalette.kRed,
            child: BlocConsumer<HomeCubit, HomeState>(
              listener: (context, state) {
                if (state is HomeLoadSucess) {
                  if (state.showBottomSheet)
                    showModalBottomSheet(
                      context: context,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      builder: (context) => InfoBottomSheet(),
                    );
                }
              },
              builder: (context, state) {
                final _indexFeatured = _bloc.indexFeatured;
                final _indexResultModel = _bloc.indexResultModel;
                if (state is HomeLoadSucess) {
                  final _resultModelLenght = state.resultModel?.length ?? 0;
                  return SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    controller: _bloc.scrollController,
                    child: Stack(
                      children: [
                        FeaturedDetail(
                          height: _size.height * 0.6,
                          urlImage:
                              '${NetworkAddres.kNetflixFeatured}${state.resultModel?[_indexResultModel].results?[_indexFeatured].backdropPath}',
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _DescriptionArea(
                              width: _size.width,
                              height: _size.height * 0.5,
                              name:
                                  '${state.resultModel?[_indexResultModel].results?[_indexFeatured].name}',
                              voteAverage:
                                  '${state.resultModel?[_indexResultModel].results?[_indexFeatured].voteAverage}',
                              year:
                                  '${state.resultModel?[_indexResultModel].results?[_indexFeatured].firstAirDate?.year}',
                              description:
                                  '${state.resultModel?[_indexResultModel].results?[_indexFeatured].overview}',
                            ),
                            _ListArea(
                              height: (260 * _resultModelLenght).toDouble(),
                              state: state,
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }

                return const Center(
                  child: CircularProgressIndicator(
                    color: ColorPalette.kRed,
                  ),
                );
              },
            ),
          ),
          const CustomAppBar(),
        ],
      ),
    );
  }
}

class _DescriptionArea extends StatelessWidget {
  final double width;
  final double height;
  final String name;
  final String voteAverage;
  final String? year;
  final String description;
  const _DescriptionArea({
    required this.width,
    required this.height,
    required this.name,
    required this.voteAverage,
    this.year,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      height: height,
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.headline2?.copyWith(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
          ),
          SizedBox(
            width: 150,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$voteAverage pontos',
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                        color: ColorPalette.kLightGreen,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  year ?? '',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Text(
            description,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}

class _ListArea extends StatelessWidget {
  final double height;
  final HomeLoadSucess state;

  const _ListArea({
    required this.height,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
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
    );
  }
}
