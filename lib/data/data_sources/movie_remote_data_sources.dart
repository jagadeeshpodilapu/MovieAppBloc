import 'package:movieapp/data/core/api_client.dart';
import 'package:movieapp/data/models/movie_model.dart';
import 'package:movieapp/data/models/movies_results_model.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getTrending();
  Future<List<MovieModel>> getPopular();
  Future<List<MovieModel>> getPlayingNow();
  Future<List<MovieModel>> getComingSoon();
}

class MovieRemoteDataSourceImpl extends MovieRemoteDataSource {
  final ApiClient _client;

  MovieRemoteDataSourceImpl(this._client);

  @override
  Future<List<MovieModel>> getTrending() async {
    final response = await _client.get('trending/movie/day');

    final movies = MovieResultModel.fromJson(response).movie;
    print("movies  $movies");
    return movies;
  }

  @override
  Future<List<MovieModel>> getPopular() async {
    final response = await _client.get('movie/popular');

    final popular = MovieResultModel.fromJson(response).movie;
    print("popular  $popular");

    return popular;
  }

  @override
  Future<List<MovieModel>> getPlayingNow() async {
    final response = await _client.get('movie/now_playing/');

    final playingNow = MovieResultModel.fromJson(response).movie;
    print("playingNow $playingNow");

    return playingNow;
  }

  @override
  Future<List<MovieModel>> getComingSoon() async {
    final response = await _client.get('movie/upcoming');

    final comingSoon = MovieResultModel.fromJson(response).movie;
    print("comingSoon $comingSoon");

    return comingSoon;
  }
}
