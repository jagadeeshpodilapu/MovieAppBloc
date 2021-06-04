import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'movie_corousel_event.dart';
part 'movie_corousel_state.dart';

class MovieCorouselBloc extends Bloc<MovieCorouselEvent, MovieCorouselState> {
  MovieCorouselBloc() : super(MovieCorouselInitial());

  @override
  Stream<MovieCorouselState> mapEventToState(
    MovieCorouselEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
