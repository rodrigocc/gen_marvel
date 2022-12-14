class McuListModel {
  late List<McuModel> mcu;

  McuListModel({required this.mcu});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['mcu'] = mcu.map((v) => v.toJson()).toList();
    return data;
  }
}

class McuModel {
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  McuModel(
      {this.adult,
      this.backdropPath,
      this.genreIds,
      this.id,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount});

  static List<McuModel> fromJsonList(List<dynamic> json) {
    List<McuModel> mcuMovies = [];
    if (json.isEmpty) {
      return mcuMovies;
    }
    for (int i = 0; i < json.length; i++) {
      McuModel movie = McuModel(
        adult: json[i]['adult'],
        backdropPath: json[i]['backdrop_path'],
        genreIds: List<int>.from(json[i]['genre_ids']),
        id: json[i]['id'],
        originalLanguage: json[i]['original_language'],
        originalTitle: json[i]['original_title'],
        overview: json[i]['overview'],
        popularity: json[i]['popularity'],
        posterPath: json[i]['poster_path'],
        releaseDate: json[i]['release_date'],
        title: json[i]['title'],
        video: json[i]['video'],
        voteAverage: json[i]['vote_average'],
        voteCount: json[i]['vote_count'],
      );
      mcuMovies.add(movie);
    }
    return mcuMovies;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['adult'] = adult;
    data['backdrop_path'] = backdropPath;
    data['genre_ids'] = genreIds;
    data['id'] = id;
    data['original_language'] = originalLanguage;
    data['original_title'] = originalTitle;
    data['overview'] = overview;
    data['popularity'] = popularity;
    data['poster_path'] = posterPath;
    data['release_date'] = releaseDate;
    data['title'] = title;
    data['video'] = video;
    data['vote_average'] = voteAverage;
    data['vote_count'] = voteCount;
    return data;
  }
}
