import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';
import 'package:movie_app/widgets/description.dart';

class DiscoverMovies extends StatelessWidget {
  final List discover;
  const DiscoverMovies({Key? key, required this.discover}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(text: 'Discover New Movies',
            color: Colors.white,
            size: 23,),
          SizedBox(height: 10,),
          Container(
            height: 260,
            child: ListView.builder( itemCount: discover.length ,
                scrollDirection:Axis.horizontal,
                itemBuilder: (context, index){
                  return InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Description(
                            name: discover[index]['title'],
                            description: discover[index]['overview'],
                            bannerurl:'https://image.tmdb.org/t/p/w500'+discover[index]['backdrop_path'],
                            posterurl: 'https://image.tmdb.org/t/p/w500'+discover[index]['poster_path'],
                            vote: discover[index]['vote_average'].toString(),
                            launch_on: discover[index]['release_date'])));

                      },
                      child: Container(
                        width: 140,
                        child: Column(
                          children: [
                            Container(
                              height:200,
                              decoration: BoxDecoration(image: DecorationImage(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500'+discover[index]['poster_path']
                                  )
                              )),
                            ),
                            Container(child: modified_text(text: discover[index]['title']!=null?
                            discover[index]['title']:'Loading' ,
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