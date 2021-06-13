import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/data/core/api_constants.dart';
import 'package:movieapp/presentation/bloc/movie_backdrop/movie_backdrop_bloc.dart';

class MovieBackdropWidget extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      alignment: Alignment.topCenter,
      heightFactor: 0.7,
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(40),
        ),
        child: Stack(
          children: <Widget>[
            FractionallySizedBox(
              heightFactor: 1,
              widthFactor: 1,
              child:BlocBuilder<MovieBackdropBloc, MovieBackdropState>(
                builder: (_, state) {
                  if (state is MovieBackdropChanged) {
                    return CachedNetworkImage(
                      imageUrl:
                      '${ApiConstants.BASE_IMAGE_URL}${state.movie.backdropPath}',
                      fit: BoxFit.fitHeight,
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Container(
                width: 400,
                height: 1,
                color: Colors.transparent,
              ),
            ),
          ],
        ),
      ),
    );


  }


}

