import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_discovery_app/controllers/movie_controllers.dart';
import 'package:movie_discovery_app/data/constants.dart';
import 'package:movie_discovery_app/theme/app_theme.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:search_page/search_page.dart';

import '../../models/movie_model.dart';

//   feedsWidegt for showing Recent and generic films with there specific informations
//  it contains different widgets
//  ``` FeedsHeader() ``` is the header(appbar) which contains icon,Title
//and search Icons
// ``` RecentMovies() ``` this show Recent movies which contais Image.Network()
//for poster, Text widget for holdint title and other informations about the film
// also it has Botom navigation bar ``` google nav bar ```

class FeedsWidget extends StatefulWidget {
  const FeedsWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FeedsWidgetState createState() => _FeedsWidgetState();
}

class _FeedsWidgetState extends State<FeedsWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: SizedBox(
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FeedsHeader(),
            SizedBox(
              height: size.height * 0.01,
            ),
            Container(
              padding: EdgeInsets.all(size.width * 0.015),
              width: size.width / 1.15,
              child: const Text(
                "Recent",
                style: AppTheme.recentMoviesHeaderStyle,
              ),
            ),
            SizedBox(
              // color: Colors.amber,
              width: size.width,
              height: size.height * 0.65,
              child: RecentMovies(),
            ),
            SizedBox(
              height: size.height * 0.4,
              child: PopularMovies(),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class FeedsHeader extends StatelessWidget {
  // this sureve as app bar
  List<MovieModel> movies = Get.find<MovieController>().recentMovies;

  FeedsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.local_movies_outlined,
                size: size.height * 0.05,
              ),
              SizedBox(
                width: size.width * 0.02,
              ),
              const Text(
                "Movie Plus",
                style: AppTheme.appBarTitleStyle,
              )
            ],
          ),
          IconButton(
              onPressed: () {
                showSearch(
                    context: context,
                    delegate: SearchPage(
                        builder: (movie) => InkWell(
                              onTap: () {},
                              child: ListTile(
                                hoverColor: Colors.grey,
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      "https://image.tmdb.org/t/p/w220_and_h330_face${movie.posterpath}"),
                                ),
                                title: Text(
                                  movie.title.toString(),
                                ),
                                subtitle: Text(movie.releasedate!),
                              ),
                            ),
                        filter: (movie) {
                          return [
                            movie.title,
                          ];
                        },
                        items: movies));
              },
              icon: Icon(
                Icons.search,
                size: size.width * 0.07,
              ))
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class RecentMovies extends StatelessWidget {
  int focusedIndex = 0;
  MovieController movieController = Get.find();

  RecentMovies({super.key});

  void _onItemFocus(int index) {
    focusedIndex = index;
  }

  Widget _itemBuilder(BuildContext ctx, int index) {
    final movies = movieController.recentMovies;
    final size = MediaQuery.of(ctx).size;

    return Container(
      padding: EdgeInsets.only(bottom: size.height * 0.02),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size.width * 0.1),
      ),

      width: size.width / 1.6, // Make items wider
      height: size.height * 0.53,
      child: Column(
        children: [
          Container(
            width: size.width / 1.5,
            padding: EdgeInsets.only(bottom: size.height * 0.02),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(size.width * 0.1),
              // color: Colors.transparent,
              boxShadow: [
                const BoxShadow(
                  color: Colors.white,
                  offset: Offset(20, 0),
                ),
                const BoxShadow(
                  color: Colors.white,
                  offset: Offset(20, 0),
                ),
                BoxShadow(
                  offset: const Offset(0, 5),
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 5,
                  blurRadius: 15,
                ),
              ],
            ),
            child: SizedBox(
              height: size.height * 0.5,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(size.width * 0.1),
                child: FadeInImage(
                  placeholder: const AssetImage(Constants.pic1),
                  image: NetworkImage(
                    "https://image.tmdb.org/t/p/w220_and_h330_face${movies[index].posterpath}",
                  ),
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                ),
              ),
            ),
          ),
          SizedBox(
            width: size.width / 1.5,
            child: Text(movies[index].title!,
                textAlign: TextAlign.start,
                style: AppTheme.recontMovieTitleStyle),
          ),
          SizedBox(
            width: size.width / 1.5,
            child: Text(movieController.getGeners(movies[index].genreids),
                textAlign: TextAlign.left,
                style: AppTheme.recontMovieGenreStyle),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {},
      child: SizedBox(
        width: size.width,
        child: GetBuilder<MovieController>(
          builder: (GetxController controller) {
            return ScrollSnapList(
              itemBuilder: _itemBuilder,
              itemCount: movieController.recentMovies.length,
              itemSize: size.width / 1.6, // Make items wider
              onItemFocus: _onItemFocus,
              dynamicItemSize: true,
              dynamicItemOpacity:
                  0.7, // Adjust opacity for the current and next item
              initialIndex: 0,
              updateOnScroll: true,
              curve: Curves.bounceInOut,
              focusOnItemTap: true,
              shrinkWrap: true,
            );
          },
        ),
      ),
    );
  }
}

class PopularMovies extends StatelessWidget {
  PopularMovies({super.key});

  final MovieController _movieController = Get.find();

  @override
  Widget build(BuildContext context) {
    final popularMovies = _movieController.popularMovies;
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {},
      child: GetBuilder<MovieController>(
        builder: (GetxController controller) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: size.height * 0.01),
                width: size.width * 0.4,
                height: size.height * 0.6,
                child: Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        child: FadeInImage(
                          placeholder: const AssetImage(Constants.pic1),
                          image: NetworkImage(
                            "https://image.tmdb.org/t/p/w220_and_h330_face${popularMovies[index].posterpath!}",
                          ),
                          fit: BoxFit.cover,
                          height: size.height * 0.3,
                          width: size.width * 0.4,
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(
                            left: size.width * 0.01, right: size.width * 0.01),
                        child: Text(popularMovies[index].originaltitle!,
                            style: AppTheme.popularMovieTitleStyle),
                      ),
                      Container(
                        width: double.infinity,
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.01),
                        child: Text(
                          _movieController
                              .getGeners(popularMovies[index].genreids),
                          style: AppTheme.popularMovieGenresStyle,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: size.height * 0.02,
                        padding: EdgeInsets.only(
                            left: size.width * 0.01, right: size.width * 0.01),
                        child: Text(
                          "Popularity:  ${popularMovies[index].popularity.toString()}",
                          maxLines: 2,
                          style: AppTheme.popularMoviePopularityStyle,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            itemCount: popularMovies.length,
          );
        },
      ),
    );
  }
}
