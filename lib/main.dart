import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_app/splash_page.dart';
import 'package:movie_app/utils/text.dart';
import 'package:movie_app/widgets/genre_movies.dart';
import 'package:movie_app/widgets/toprated.dart';
import 'package:movie_app/widgets/trending.dart';
import 'package:movie_app/widgets/discovermovies.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:movie_app/widgets/upcoming_movies.dart';


void main()=> runApp(new MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Splash_page(),
      debugShowCheckedModeBanner:false,
      theme: ThemeData(brightness: Brightness.dark
      ,primaryColor: Colors.green,
      )
    );
  }
}
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trendingmovies = [];
  List topratedmovies = [];
  List discovermovies = [];
  List upcomingmovies = [];
  List genre_movies = [];
  final String apikey = '8a3eebed8b3c2ff16f090496da0fa9d8';
  final readaccesstoken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4YTNlZWJlZDhiM2MyZmYxNmYwOTA0OTZkYTBmYTlkOCIsInN1YiI6IjY0MzkyNmJkYzI2Nzk2MDA3N2I3ODA2YyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.tprZqxWM7XUHsCcawszwRLhKigNselTfXGMP7xZQpMM';


  @override
  void initState() {
    loadmovies();
    super.initState();
  }

  loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apikey, readaccesstoken),
        logConfig: ConfigLogger(
          showLogs: true,
          showErrorLogs: true,
        ));
    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topratedresult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map discover_moviesresult = await tmdbWithCustomLogs.v3.discover
        .getMovies();
    Map upcoming_moviesresult = await tmdbWithCustomLogs.v3.movies.getUpcoming();
    Map genre_result = await tmdbWithCustomLogs.v3.tv.getTopRated();
    print('hello');
    print(genre_result);
    print(topratedresult);

    setState(() {
      trendingmovies = trendingresult['results'];
      topratedmovies = topratedresult['results'];
      discovermovies = discover_moviesresult['results'];
      upcomingmovies = upcoming_moviesresult['results'];
      genre_movies = genre_result['results'];
    });



  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: modified_text(text: 'Movie App 🎬',
        color: Colors.white,
        size: 23,),
        elevation: 13,
        backgroundColor: Colors.yellow.shade800,
        shadowColor: Colors.yellow.shade900,
        centerTitle: true,),
      body: ListView(
        children: [
          TopRated(toprated: topratedmovies,),
          DiscoverMovies(discover: discovermovies),
          TrendingMovies(trending: trendingmovies,),
          UpcomingMovies(upcomingmovies: upcomingmovies),
          Genre_Movie(genre: genre_movies)

        ],
      ),
    );
  }
}

