import 'package:netflix_clone/data/model/featured_model.dart';

class ResultModel {
  final String? slug;
  final List<FeaturedModel>? results;

  ResultModel({
    required this.slug,
    required this.results,
  });

  ResultModel.empty({this.slug, this.results});

  factory ResultModel.fromMap(Map<String, dynamic> map, {String? slug}) {
    return ResultModel(
      slug: slug,
      results: List<FeaturedModel>.from(
          map['results']?.map((x) => FeaturedModel.fromMap(x))),
    );
  }
}
