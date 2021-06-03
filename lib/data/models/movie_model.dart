import 'package:movieapp/domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  MovieModel({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.voteCount,
    required this.originalLanguage,
    required this.originalTitle,
    required this.posterPath,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.id,
    required this.overview,
    required this.releaseDate,
    required this.popularity,
  }) : super(
            id: id,
            title: title,
            backdropPath: backdropPath,
            posterPath: posterPath,
            releaseDate: releaseDate,
            voteAverage: voteAverage,
            overview: overview);

  final bool adult;
  final String backdropPath;
  final List<int> genreIds;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final String releaseDate;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        adult: json["adult"] ?? "",
        backdropPath: json["backdrop_path"] ?? "",
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        voteCount: json["vote_count"] ?? 0,
        originalLanguage: json["original_language"] ?? "",
        originalTitle: json["original_title"] ?? "",
        posterPath: json["poster_path"] ?? "",
        title: json["title"] ?? "",
        video: json["video"] ?? "",
        voteAverage: json["vote_average"].toDouble() ?? 0.0,
        id: json["id"],
        overview: json["overview"] ?? "",
        releaseDate: json["release_date"] ?? "",
        popularity: json["popularity"].toDouble() ?? 0.0,
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "vote_count": voteCount,
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "poster_path": posterPath,
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "id": id,
        "overview": overview,
        "release_date": releaseDate,
        "popularity": popularity,
      };
}
