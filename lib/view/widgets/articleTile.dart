// ignore_for_file: prefer_const_constructors

import 'package:api_news_app/view/web_view.dart';
import 'package:flutter/material.dart';

class ArticleTile extends StatelessWidget {
  const ArticleTile({super.key, this.title, this.description, this.imageUrl, this.url});

  final String? title, description, imageUrl,url;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WebView(blogUrl: url!),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(imageUrl!),
            ),
            Text(
              title!,
              style: TextStyle(fontSize: 15, color: Colors.black),
            ),
            Text(
              description!,
              style: TextStyle(fontSize: 10, color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
