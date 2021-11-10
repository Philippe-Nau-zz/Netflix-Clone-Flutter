part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeLoadInProgress extends HomeState {}
class HomeLoadFailure extends HomeState {
  final String error;

  HomeLoadFailure(this.error);
}

class HomeLoadSucess extends HomeState {
  final List<ResultModel>? resultModel;
  final bool showBottomSheet;
  HomeLoadSucess({
    this.resultModel,
    this.showBottomSheet = true,
  });
}
