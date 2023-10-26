// all app theme will be implemented here
import 'package:flutter/material.dart';

class AppTheme {
  static const TextStyle appBarTitleStyle = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w900,
    fontFamily: 'ArgentumSans',
  );
  static const TextStyle recentMoviesHeaderStyle = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w900,
    fontFamily: 'ArgentumSans',
  );
  static const TextStyle recontMovieTitleStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w900,
    overflow: TextOverflow.ellipsis,
    fontFamily: 'ArgentumSans',
  );
  static const TextStyle recontMovieGenreStyle = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Colors.grey,
      overflow: TextOverflow.ellipsis);
  static const TextStyle popularMovieTitleStyle = TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 12,
      fontFamily: 'ArgentumSans',
      overflow: TextOverflow.ellipsis);
  static const TextStyle popularMovieGenresStyle = TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 8,
      color: Color.fromRGBO(42, 42, 42, 0.5));
  static const TextStyle popularMoviePopularityStyle = TextStyle(
    fontSize: 9,
    fontWeight: FontWeight.w400,
    overflow: TextOverflow.ellipsis,
  );
}
