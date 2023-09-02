// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:api_news_app/view/category_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({super.key,this.categoryName, this.imageUrl});



  final String? categoryName, imageUrl;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoryScreen(
          category: categoryName!.toLowerCase(),
        ),),);
      },
      child: Container(
        margin:  EdgeInsets.only(right: 10,),
        child:  Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: CachedNetworkImage(
                imageUrl: imageUrl!,
                height: 80,
                width: 120,
                fit: BoxFit.cover,
              ),

            ),
            Container(
              width: 120,
              height: 70,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(categoryName!,style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold),),
            ),
          ],
        ),

      ),
    );
  }
}

