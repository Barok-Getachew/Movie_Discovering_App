class MovieModel {
  bool? adult;
  String? backdroppath;
  List<dynamic>? genreids;
  int? id;
  String? originallanguage;
  String? originaltitle;
  String? overview;
  double? popularity;
  String? posterpath;
  String? releasedate;
  String? title;
  // bool? video;
  double? voteaverage;
  double? votecount;

  MovieModel({
    this.adult,
    this.backdroppath,
    this.genreids,
    this.id,
    this.originallanguage,
    this.originaltitle,
    this.overview,
    this.popularity,
    this.posterpath,
    this.releasedate,
    this.title,
    // this.video,
    this.voteaverage,
    this.votecount,
  });
}
