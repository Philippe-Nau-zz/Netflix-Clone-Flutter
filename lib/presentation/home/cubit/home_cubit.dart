import 'dart:io';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:netflix_clone/data/model/result_model.dart';
import 'package:netflix_clone/data/repository/home_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository _homeRepository = HomeRepository();
  final ScrollController scrollController = ScrollController();

  HomeCubit() : super(HomeLoadInProgress());

  int indexFeatured = 0;
  int indexResultModel = 0;
  Set<String> errorMsg = Set();

  Future<void> fetchHomeItems([bool showBottomSheet = true]) async {
    try {
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

      if (errorMsg.isEmpty) {
        randomFeatured(_listResultModel);
        emit(
          HomeLoadSucess(
            resultModel: _listResultModel,
            showBottomSheet: showBottomSheet,
          ),
        );
      }

      if(errorMsg.isNotEmpty){
        errorMsg.forEach((error) {
          emit(HomeLoadFailure(error));
        });
      }

    } on SocketException {
      emit(
        HomeLoadFailure(
            'Não foi possível conectar ao servidor, verifique sua conexão com a internet ou, tente novamente mais tarde'),
      );
    }
  }

  Future<ResultModel> fetchOriginals() async {
    late ResultModel _result;
    final _data = await _homeRepository.fetchNetflixOriginal();
    _data.fold(
      (left) {
        errorMsg.add(left);
        _result = ResultModel.empty();
      },
      (right) => _result = right,
    );
    return _result;
  }

  Future<ResultModel> fetchTrendings() async {
    late ResultModel _result;
    final _data = await _homeRepository.fetchNetflixTrending();
    _data.fold(
      (left) {
        errorMsg.add(left);
        _result = ResultModel.empty();
      },
      (right) => _result = right,
    );
    return _result;
  }

  Future<ResultModel> fetchTop() async {
    late ResultModel _result;
    final _data = await _homeRepository.fetchNetflixTop();
    _data.fold(
      (left) {
        errorMsg.add(left);
        _result = ResultModel.empty();
      },
      (right) => _result = right,
    );
    return _result;
  }

  Future<ResultModel> fetchAction() async {
    late ResultModel _result;
    final _data = await _homeRepository.fetchNetflixAction();
    _data.fold(
      (left) {
        errorMsg.add(left);
        _result = ResultModel.empty();
      },
      (right) => _result = right,
    );
    return _result;
  }

  Future<ResultModel> fetchComedy() async {
    late ResultModel _result;
    final _data = await _homeRepository.fetchNetflixComedy();
    _data.fold(
      (left) {
        errorMsg.add(left);
        _result = ResultModel.empty();
      },
      (right) => _result = right,
    );
    return _result;
  }

  Future<ResultModel> fetchHorror() async {
    late ResultModel _result;
    final _data = await _homeRepository.fetchNetflixHorror();
    _data.fold(
      (left) {
        errorMsg.add(left);
        _result = ResultModel.empty();
      },
      (right) => _result = right,
    );
    return _result;
  }

  Future<ResultModel> fetchRomance() async {
    late ResultModel _result;
    final _data = await _homeRepository.fetchNetflixRomance();
    _data.fold(
      (left) {
        errorMsg.add(left);
        _result = ResultModel.empty();
      },
      (right) => _result = right,
    );
    return _result;
  }

  Future<ResultModel> fetchDocumentary() async {
    late ResultModel _result;
    final _data = await _homeRepository.fetchNetflixDocumentary();
    _data.fold(
      (left) {
        errorMsg.add(left);
        _result = ResultModel.empty();
      },
      (right) => _result = right,
    );
    return _result;
  }

  randomFeatured(List<ResultModel> list) {
    indexResultModel = Random().nextInt(list.length - 1);
    do {
      indexFeatured =
          Random().nextInt(list[indexResultModel].results?.length ?? 0);
    } while (list[0].results?[indexFeatured].backdropPath == null);
  }
}
