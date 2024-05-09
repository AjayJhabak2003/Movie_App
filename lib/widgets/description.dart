import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';
class Description extends StatelessWidget {
  final String name, description, bannerurl,posterurl, vote,launch_on;
  const Description ({Key? key,required this.name,required this.description,required this.bannerurl,required this.posterurl,required this.vote,required this.launch_on}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child:ListView(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Container(
                height: 300,
                child: Stack(
                  children: [
                    Positioned(child:Container(
                      height: 300,
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(bannerurl,fit: BoxFit.cover,),
                    )),
                    Positioned(
                      bottom: 15,
                        child: modified_text(text: "  ⭐Rating :-"+vote, color: Colors.white, size: 20))
                  ],
                ),
              ),
            ),
            SizedBox(height: 13,),

            SizedBox(height: 13,),
            Row(
              children: [
                SizedBox(width: 15,),
                ClipRRect(

                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    width: 100,
                    height: 190,
                    child: Image.network(posterurl,fit: BoxFit.cover,),
                  ),
                ),
                SizedBox(width: 10,),
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(4),
                        child: modified_text(text: name, color: Colors.white, size: 26),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        padding: EdgeInsets.only(top: 5,right: 30),
                        child: modified_text(text: 'Releasing on :-'+launch_on, color:Colors.white, size: 16),
                      )
                      
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 15,),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey.shade800,


              ),
              padding: EdgeInsets.all(7),
              margin: EdgeInsets.all(13),
              child: modified_text(text: 'Overview  :-   ' +description, color: Colors.white, size: 18),
            )
          ],
        ),
      ),
    );
  }
}
