import 'dart:convert';
import 'package:either_dart/either.dart';
import 'package:http/http.dart' as http;
import 'package:netflix_clone/data/model/result_model.dart';
import 'package:netflix_clone/utils/network_addres.dart';

class HomeRepository {

  Future<Either<String, ResultModel>> fetchNetflixOriginal() async {
    try {
      final _response = await http.get(NetworkAddres.kNetflixOriginal);
      if (_response.statusCode == 200) {
        final _decoded = jsonDecode(_response.body);
        final _data = ResultModel.fromMap(_decoded, slug: 'Originais da Netflix');
        return Right(_data);
      }
      return Left('value');
    } on Exception catch (e) {
      throw e;
    }
  }

  Future<Either<String, ResultModel>> fetchNetflixTrending() async {
    try {
      final _response = await http.get(NetworkAddres.kNetflixTrending);
      if (_response.statusCode == 200) {
        final _decoded = jsonDecode(_response.body);
        final _data = ResultModel.fromMap(_decoded, slug: 'Recomendados para Você');
        return Right(_data);
      }
      return Left('value');
    } on Exception catch (e) {
      throw e;
    }
  }

  Future<Either<String, ResultModel>> fetchNetflixTop() async {
    try {
      final _response = await http.get(NetworkAddres.kNetflixTop);
      if (_response.statusCode == 200) {
        final _decoded = jsonDecode(_response.body);
        final _data = ResultModel.fromMap(_decoded, slug: 'Em Alta');
        return Right(_data);
      }
      return Left('value');
    } on Exception catch (e) {
      throw e;
    }
  }

  Future<Either<String, ResultModel>> fetchNetflixAction() async {
    try {
      final _response = await http.get(NetworkAddres.kNetflixAction);
      if (_response.statusCode == 200) {
        final _decoded = jsonDecode(_response.body);
        final _data = ResultModel.fromMap(_decoded, slug: 'Ação');
        return Right(_data);
      }
      return Left('value');
    } on Exception catch (e) {
      throw e;
    }
  }

  Future<Either<String, ResultModel>> fetchNetflixComedy() async {
    try {
      final _response = await http.get(NetworkAddres.kNetflixComedy);
      if (_response.statusCode == 200) {
        final _decoded = jsonDecode(_response.body);
        final _data = ResultModel.fromMap(_decoded, slug: 'Comédia');
        return Right(_data);
      }
      return Left('value');
    } on Exception catch (e) {
      throw e;
    }
  }

  Future<Either<String, ResultModel>> fetchNetflixHorror() async {
    try {
      final _response = await http.get(NetworkAddres.kNetflixHorror);
      if (_response.statusCode == 200) {
        final _decoded = jsonDecode(_response.body);
        final _data = ResultModel.fromMap(_decoded, slug: 'Terror');
        return Right(_data);
      }
      return Left('value');
    } on Exception catch (e) {
      throw e;
    }
  }

  Future<Either<String, ResultModel>> fetchNetflixRomance() async {
    try {
      final _response = await http.get(NetworkAddres.kNetflixRomance);
      if (_response.statusCode == 200) {
        final _decoded = jsonDecode(_response.body);
        final _data = ResultModel.fromMap(_decoded, slug: 'Romance');
        return Right(_data);
      }
      return Left('value');
    } on Exception catch (e) {
      throw e;
    }
  }

  Future<Either<String, ResultModel>> fetchNetflixDocumentary() async {
    try {
      final _response = await http.get(NetworkAddres.kNetflixDocumentary);
      if (_response.statusCode == 200) {
        final _decoded = jsonDecode(_response.body);
        final _data = ResultModel.fromMap(_decoded, slug: 'Documentátios');
        return Right(_data);
      }
      return Left('value');
    } on Exception catch (e) {
      throw e;
    }
  }

}
