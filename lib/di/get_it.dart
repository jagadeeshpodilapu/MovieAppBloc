import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:movieapp/data/core/api_client.dart';
import 'package:movieapp/data/data_sources/movie_remote_data_sources.dart';
import 'package:movieapp/data/repository/movie_repository_impl.dart';
import 'package:movieapp/domain/repository/movie_repository.dart';
import 'package:movieapp/usecases/get_comingsoon.dart';
import 'package:movieapp/usecases/get_playingnow.dart';
import 'package:movieapp/usecases/get_popular.dart';
import 'package:movieapp/usecases/get_trending.dart';

final getItInstance = GetIt.instance;

Future init() async {
  getItInstance.registerLazySingleton<Client>(() => Client());

  getItInstance
      .registerLazySingleton<ApiClient>(() => ApiClient(getItInstance()));
  getItInstance.registerLazySingleton<MovieRemoteDataSource>(
          () => MovieRemoteDataSourceImpl(getItInstance()));

  getItInstance.registerLazySingleton<GetTrending>(
          () => GetTrending(movieRepository: getItInstance()));
  getItInstance
      .registerLazySingleton<GetPopular>(() => GetPopular(getItInstance()));
  getItInstance.registerLazySingleton<GetPlayingNow>(
          () => GetPlayingNow(getItInstance()));
  getItInstance.registerLazySingleton<GetComingSoon>(
          () => GetComingSoon(getItInstance()));
  getItInstance.registerLazySingleton < MovieRepository > (
          () => MovieRepositoryImpl(remoteDataSource: getItInstance()));
  }
