import 'package:dartz/dartz.dart';
import 'package:movieapp/domain/entities/app_error.dart';
import 'package:movieapp/domain/entities/movie_entity.dart';
import 'package:movieapp/domain/entities/no_params.dart';
import 'package:movieapp/domain/repository/movie_repository.dart';
import 'package:movieapp/usecases/usecase.dart';

class GetPopular extends UseCase<List<MovieEntity>, NoParams> {
  final MovieRepository movieRepository;

  GetPopular(this.movieRepository);

  @override
  Future<Either<AppError, List<MovieEntity>>> call(NoParams noParams) async {
    return await movieRepository.getPopular();
  }
}
