class FeaturedModel {
  final String? backdropPath;
  final String? posterPath;
  final String? name;
  final DateTime? firstAirDate;
  final String? originalName;
  final String? overview;
  final dynamic voteAverage;

  FeaturedModel({
    this.backdropPath,
    this.posterPath,
    this.name,
    this.firstAirDate,
    this.originalName,
    this.overview,
    this.voteAverage,
  });

  factory FeaturedModel.fromMap(Map<String, dynamic> map) {
    return FeaturedModel(
      backdropPath: map['backdrop_path'] as String?,
      posterPath: map['poster_path'] as String?,
      name: map['name'] as String?,
      firstAirDate: stringToDate(map['first_air_date']),
      originalName: map['original_name'] as String?,
      overview: map['overview'] as String?,
      voteAverage: map['vote_average'] as dynamic,
    );
  }
}

DateTime? stringToDate(String? date) {
  if (date != null) {
    return DateTime.parse(date);
  }
}
