import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';
import 'package:movie_app/widgets/description.dart';
class UpcomingMovies extends StatelessWidget {
  final List upcomingmovies;
  const UpcomingMovies({Key? key, required this.upcomingmovies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(text: 'Upcoming Movies',
            color: Colors.white,
            size: 23,),
          SizedBox(height: 10,),
          Container(
            height: 260,
            child: ListView.builder( itemCount: upcomingmovies.length ,
                scrollDirection:Axis.horizontal,
                itemBuilder: (context, index){
                  return InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Description(
                            name: upcomingmovies[index]['title'],
                            description: upcomingmovies[index]['overview'],
                            bannerurl:'https://image.tmdb.org/t/p/w500'+upcomingmovies[index]['backdrop_path'],
                            posterurl: 'https://image.tmdb.org/t/p/w500'+upcomingmovies[index]['poster_path'],
                            vote: upcomingmovies[index]['vote_average'].toString(),
                            launch_on: upcomingmovies[index]['release_date'])));

                      },
                      child: Container(
                        width: 140,
                        child: Column(
                          children: [
                            Container(
                              height:200,
                              decoration: BoxDecoration(image: DecorationImage(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500'+upcomingmovies[index]['poster_path']
                                  )
                              )),
                            ),
                            Container(child: modified_text(text: upcomingmovies[index]['title']!=null?
                            upcomingmovies[index]['title']:'Loading' ,
                              color: Colors.white,
                              size: 15,),)
                          ],
                        ),
                      )
                  );
                }),
          )
        ],
      ),
    );
  }
}