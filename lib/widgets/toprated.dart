import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';
import 'package:movie_app/widgets/description.dart';
class TopRated extends StatelessWidget {
  final List toprated;
  const TopRated({Key? key, required this.toprated}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(text: 'Top Rated Movies',
            color: Colors.white,
            size: 23,),
          SizedBox(height: 10,),
          Container(
            height: 240,
            child: ListView.builder( itemCount: toprated.length ,
                scrollDirection:Axis.horizontal,
                itemBuilder: (context, index){
                  return InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Description(
                            name: toprated[index]['title'],
                            description: toprated[index]['overview'],
                            bannerurl:'https://image.tmdb.org/t/p/w500'+toprated[index]['backdrop_path'],
                            posterurl: 'https://image.tmdb.org/t/p/w500'+toprated[index]['poster_path'],
                            vote: toprated[index]['vote_average'].toString(),
                            launch_on: toprated[index]['release_date'])));

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
                                      'https://image.tmdb.org/t/p/w500'+toprated[index]['backdrop_path']
                                  ),
                                fit: BoxFit.cover
                              )),
                            ),
                            SizedBox(height: 10,),
                            Container(child: modified_text(text: toprated[index]['title']!=null?
                            toprated[index]['title']:'Loading' ,
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