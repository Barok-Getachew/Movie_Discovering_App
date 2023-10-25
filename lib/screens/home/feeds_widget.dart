import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_discovery_app/controllers/movie_controllers.dart';
import 'package:movie_discovery_app/data/constants.dart';
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
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
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
              child: const GenericsMovies(),
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
  List<MovieModel> movies = Get.find<MovieController>().movies ;

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
                Icons.movie_creation_outlined,
                size: size.width * 0.08,
              ),
              SizedBox(
                width: size.width * 0.02,
              ),
              const Text(
                "Movie Plus",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
              )
            ],
          ),
          IconButton(
              onPressed: () {
                showSearch(
                    context: context,
                    delegate: SearchPage(
                        builder: (movie) => ListTile(title: Text(movie.title.toString())),
                        filter: (movie) {
                          return [
                            movie.title,
                            movie.overview, 
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

  RecentMovies({super.key});

  void _onItemFocus(int index) {
    focusedIndex = index;
  }

  Widget _itemBuilder(BuildContext ctx, int index) {
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
            child: ClipRRect(
              borderRadius: BorderRadius.circular(size.width * 0.1),
              child: Image.network(
                "https://cdn.pixabay.com/photo/2018/03/31/19/29/schnitzel-3279045_1280.jpg",
                fit: BoxFit.cover,
                height: size.height * 0.5,
              ),
              // child: Image.asset(
              //   Constants.pic1,
              //   fit: BoxFit.cover,
              // ),
            ),
          ),
          SizedBox(
            width: size.width / 1.5,
            child: const Text(
              "Joker",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          SizedBox(
            width: size.width / 1.5,
            child: const Text(
              "Crime,Drama,Thriller",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: (){},
      child: SizedBox(
        width: size.width,
        child: ScrollSnapList(
          itemBuilder: _itemBuilder,
          itemCount: 10,
          itemSize: size.width / 1.6, // Make items wider
          onItemFocus: _onItemFocus,
          dynamicItemSize: true,
          dynamicItemOpacity: 0.7, // Adjust opacity for the current and next item
          initialIndex: 0,
          updateOnScroll: true,
          curve: Curves.bounceInOut,
          focusOnItemTap: true,
          shrinkWrap: true,
        ),
      ),
    );
  }
}

class GenericsMovies extends StatelessWidget {
  const GenericsMovies({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: (){},
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: size.height * 0.015),
            width: size.width * 0.4,
            height: size.height * 0.35,
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    child: Image.asset(
                      Constants.pic1,
                      fit: BoxFit.cover,
      
                      // width: size.width * 0.4,
                    ),
                  ),
                  const Text(
                    "Joker",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  const Text(
                    "Crime,Drama,Thriller",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Color.fromRGBO(42, 42, 42, 0.5)),
                  )
                ],
              ),
            ),
          );
        },
        itemCount: 10,
      ),
    );
  }
}
