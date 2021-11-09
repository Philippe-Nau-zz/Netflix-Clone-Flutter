part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeLoadInProgress extends HomeState {}

class HomeLoadSucess extends HomeState {
  final List<ResultModel>? resultModel;
  final bool showBottomSheet;
  HomeLoadSucess({
    this.resultModel,
    this.showBottomSheet = true,
  });
}
