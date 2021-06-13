import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/dependencyinjection_loctor/get_it.dart';
import 'package:movieapp/presentation/bloc/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:movieapp/presentation/bloc/movie_corousel/movie_carousel_bloc.dart';

import 'home/movie_carousel/movie_carousel_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MovieCarouselBloc? movieCarouselBloc;
  MovieBackdropBloc? movieBackdropBloc;

  @override
  void initState() {
    super.initState();
    movieCarouselBloc = getItInstance<MovieCarouselBloc>();
    movieBackdropBloc = movieCarouselBloc!.movieBackdropBloc;

    movieCarouselBloc!.add(CarouselLoadEvent());
  }

  @override
  void dispose() {
    super.dispose();
    movieCarouselBloc?.close();
    movieBackdropBloc?.close();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => movieCarouselBloc,
        ),
        BlocProvider(
          create: (_) => movieBackdropBloc,
        )
      ],
      child: Scaffold(
        body: BlocBuilder<MovieCarouselBloc, MovieCarouselState>(
          bloc: movieCarouselBloc,
          builder: (context, state) {
            if (state is MovieCarouselLoaded) {
              return Stack(
                fit: StackFit.expand,
                children: [
                  FractionallySizedBox(
                      heightFactor: 0.6,
                      alignment: Alignment.topCenter,
                      //TODO add moviecarousel widget
                      child: MovieCarouselWidget(
                          movies: state.movies,
                          defaultIndex: state.defaultIndex)),
                  FractionallySizedBox(
                      heightFactor: 0.4,
                      alignment: Alignment.bottomCenter,
                      //TODO add movietabbed widget
                      child: Placeholder(color: Colors.grey)),
                ],
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
