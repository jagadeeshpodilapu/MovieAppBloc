import 'package:dartz/dartz.dart';
import 'package:movieapp/data/data_sources/movie_remote_data_sources.dart';
import 'package:movieapp/data/models/movie_model.dart';
import 'package:movieapp/domain/entities/app_error.dart';
import 'package:movieapp/domain/entities/movie_entity.dart';
import 'package:movieapp/domain/repository/movie_repository.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<AppError, List<MovieModel>>> getTrending() async {
    try {
      final movie = await remoteDataSource.getTrending();
      return Right(movie);
    } on Exception {
      return Left(AppError("Something went wrong"));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getComingSoon() async {
    try {
      final movie = await remoteDataSource.getComingSoon();
      return Right(movie);
    } on Exception {
      return Left(AppError("Something went wrong"));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getPlayingNow() async {
    try {
      final movie = await remoteDataSource.getPlayingNow();
      return Right(movie);
    } on Exception {
      return Left(AppError("Something went wrong"));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getPopular() async {
    try {
      final movie = await remoteDataSource.getPlayingNow();
      return Right(movie);
    } on Exception {
      return Left(AppError("Something went wrong"));
    }
  }
}
