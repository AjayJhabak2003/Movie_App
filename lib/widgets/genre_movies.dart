import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';
import 'package:movie_app/widgets/description.dart';
class Genre_Movie extends StatelessWidget {
  final List genre;
  const Genre_Movie({Key? key, required this.genre}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(text: 'Top Rated TV Shows',
            color: Colors.white,
            size: 23,),
          SizedBox(height: 10,),
          Container(
            height: 220,
            child: ListView.builder( itemCount: genre.length ,
                scrollDirection:Axis.horizontal,
                itemBuilder: (context, index){
                  return InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Description(
                            name: genre[index]['name'],
                            description: genre[index]['overview'],
                            bannerurl:'https://image.tmdb.org/t/p/w500'+genre[index]['backdrop_path'],
                            posterurl: 'https://image.tmdb.org/t/p/w500'+genre[index]['poster_path'],
                            vote: genre[index]['vote_average'].toString(),
                        launch_on: genre[index]['first_air_date'],)));


                      },
                      child: Container(
                        width: 320,
                        padding: EdgeInsets.all(5),
                        child: Column(
                          children: [
                            Container(
                              height:170,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          'https://image.tmdb.org/t/p/w500'+genre[index]['backdrop_path']
                                      ),
                                      fit: BoxFit.cover
                                  )),
                            ),
                            SizedBox(height: 10,),
                            Container(child: modified_text(text: genre[index]['name']!=null?
                            genre[index]['name']:'Loading' ,
                              color: Colors.white,
                              size: 17,),),
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