import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:netflix_clone/data/model/result_model.dart';
import 'package:netflix_clone/data/repository/home_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository _homeRepository = HomeRepository();

  HomeCubit() : super(HomeLoadInProgress());

  int indexFeatured = 0;

  Future<void> fetchHomeItems() async {
    final List<ResultModel> _listResultModel = [];
    ResultModel _original = await fetchOriginals();
    ResultModel _trending = await fetchTrendings();
    ResultModel _top = await fetchTop();
    ResultModel _action = await fetchAction();
    ResultModel _comedy = await fetchComedy();
    ResultModel _horror = await fetchHorror();
    ResultModel _romance = await fetchRomance();
    ResultModel _documentary = await fetchDocumentary();
    _listResultModel.addAll([
      _original,
      _trending,
      _top,
      _action,
      _comedy,
      _horror,
      _romance,
      _documentary,
    ]);

    randomFeatured(_listResultModel);
    emit(HomeLoadSucess(_listResultModel));
  }

  Future<ResultModel> fetchOriginals() async {
    late ResultModel _result;
    final _data = await _homeRepository.fetchNetflixOriginal();
    _data.fold(
      (left) => _result = ResultModel.empty(),
      (right) => _result = right,
    );
    return _result;
  }

  Future<ResultModel> fetchTrendings() async {
    late ResultModel _result;
    final _data = await _homeRepository.fetchNetflixTrending();
    _data.fold(
      (left) => _result = ResultModel.empty(),
      (right) => _result = right,
    );
    return _result;
  }

  Future<ResultModel> fetchTop() async {
    late ResultModel _result;
    final _data = await _homeRepository.fetchNetflixTop();
    _data.fold(
      (left) => _result = ResultModel.empty(),
      (right) => _result = right,
    );
    return _result;
  }

  Future<ResultModel> fetchAction() async {
    late ResultModel _result;
    final _data = await _homeRepository.fetchNetflixAction();
    _data.fold(
      (left) => _result = ResultModel.empty(),
      (right) => _result = right,
    );
    return _result;
  }

  Future<ResultModel> fetchComedy() async {
    late ResultModel _result;
    final _data = await _homeRepository.fetchNetflixComedy();
    _data.fold(
      (left) => _result = ResultModel.empty(),
      (right) => _result = right,
    );
    return _result;
  }

  Future<ResultModel> fetchHorror() async {
    late ResultModel _result;
    final _data = await _homeRepository.fetchNetflixHorror();
    _data.fold(
      (left) => _result = ResultModel.empty(),
      (right) => _result = right,
    );
    return _result;
  }

  Future<ResultModel> fetchRomance() async {
    late ResultModel _result;
    final _data = await _homeRepository.fetchNetflixRomance();
    _data.fold(
      (left) => _result = ResultModel.empty(),
      (right) => _result = right,
    );
    return _result;
  }

  Future<ResultModel> fetchDocumentary() async {
    late ResultModel _result;
    final _data = await _homeRepository.fetchNetflixDocumentary();
    _data.fold(
      (left) => _result = ResultModel.empty(),
      (right) => _result = right,
    );
    return _result;
  }

  randomFeatured(List<ResultModel> list) {
    indexFeatured = Random().nextInt(list.length);
  }
}
