import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:movieapp/data/core/api_client.dart';
import 'package:movieapp/data/data_sources/movie_remote_data_sources.dart';
import 'package:movieapp/data/repository/movie_repository_impl.dart';
import 'package:movieapp/domain/entities/app_error.dart';
import 'package:movieapp/domain/entities/movie_entity.dart';
import 'package:movieapp/domain/entities/no_params.dart';
import 'package:movieapp/domain/repository/movie_repository.dart';
import 'package:movieapp/usecases/get_trending.dart';

void main() async {
  ApiClient apiClient = ApiClient(Client());
  MovieRemoteDataSource dataSource = MovieRemoteDataSourceImpl(apiClient);
  MovieRepository movieRepository=MovieRepositoryImpl(remoteDataSource: dataSource);
  movieRepository.getTrending();
  GetTrending getTrending=GetTrending(movieRepository: movieRepository);
  // getTrending();
  /*dataSource.getTrending();
  dataSource.getPopular();
   dataSource.getPlayingNow();
  dataSource.getComingSoon();*/

  final Either<AppError,List<MovieEntity>>eitherResponse=await getTrending(NoParams());

  eitherResponse.fold((l) => print("error"), (r) {
    print("list of movies");
    print (r);
    return r;
  });


  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Text("hi"),
    );
  }
}


