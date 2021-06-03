// To parse this JSON data, do
//
//     final movieResultModel = movieResultModelFromJson(jsonString);

import 'package:movieapp/data/models/movie_model.dart';

class MovieResultModel {
  MovieResultModel({
    required this.movie,
  });


  List<MovieModel> movie;

  factory MovieResultModel.fromJson(Map<String, dynamic> json) =>
      MovieResultModel(

        movie: List<MovieModel>.from(
            json["results"].map((x) => MovieModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {

        "results": List<dynamic>.from(

            movie.map((x) => x.toJson())),
      };
}
