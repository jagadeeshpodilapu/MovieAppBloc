import 'package:flutter/material.dart';
import 'package:movieapp/dependencyinjection_loctor/get_it.dart';
import 'package:movieapp/presentation/bloc/movie_corousel/movie_carousel_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MovieCarouselBloc? movieCarouselBloc;

  @override
  void initState() {
    super.initState();
    movieCarouselBloc = getItInstance<MovieCarouselBloc>();
    movieCarouselBloc!.add(CarouselLoadEvent());
  }

  @override
  void dispose() {
    super.dispose();
    movieCarouselBloc?.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          FractionallySizedBox(
              heightFactor: 0.6,
              alignment: Alignment.topCenter,
              //TODO add moviecarousel widget
              child: Placeholder(color: Colors.grey)),
          FractionallySizedBox(
              heightFactor: 0.4,
              alignment: Alignment.bottomCenter,
              //TODO add movietabbed widget
              child: Placeholder(color: Colors.grey)),
        ],
      ),
    );
  }
}
