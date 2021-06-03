import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final String posterPath;
  final String backdropPath;
  final String title;
  final int id;
  final num voteAverage;
  final String releaseDate;
  final String overview;

  const MovieEntity(
      {required this.posterPath,
      required this.backdropPath,
      required this.title,
      required this.id,
      required this.voteAverage,
      required this.releaseDate,
      required this.overview});

  @override
  // ignore: override_on_non_overriding_member
  List<Object> get props => [id, title];

  @override
  // ignore: override_on_non_overriding_member
  bool get stringify => true;
}
