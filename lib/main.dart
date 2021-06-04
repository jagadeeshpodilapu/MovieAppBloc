import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/domain/entities/app_error.dart';
import 'package:movieapp/domain/entities/movie_entity.dart';
import 'package:movieapp/domain/entities/no_params.dart';
import 'package:movieapp/usecases/get_trending.dart';
import 'package:pedantic/pedantic.dart';

import 'di/get_it.dart' as getIt;

Future<void> main() async {
  unawaited(getIt.init());

  GetTrending getTrending = getIt.getItInstance<GetTrending>();

  final Either<AppError, List<MovieEntity>> eitherResponse =
      await getTrending(NoParams());

  eitherResponse.fold((l) => print("error"), (r) {
    print("list of movies");
    print(r);
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
