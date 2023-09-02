// ignore_for_file: prefer_const_constructors

import 'package:api_news_app/data_file/news.dart';
import 'package:api_news_app/models/article_model.dart';
import 'package:api_news_app/view/widgets/articleTile.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key, this.category});

  final String? category;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<ArticleModel> article = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    getCategoryNews();
  }

  getCategoryNews() async {
    CategoryNews newsClass = CategoryNews();
    await newsClass.getNews(widget.category!);
    article = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Flutter News",
          style: TextStyle(color: Colors.amber),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: _loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              padding: EdgeInsets.all(10),
              child: ListView.builder(
                itemCount: article.length,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: ClampingScrollPhysics(),
                itemBuilder: (context, index) {
                  return ArticleTile(
                    imageUrl: article[index].urlToImage,
                    title: article[index].title,
                    description: article[index].description,

                  );
                },
              ),
            ),
    );
  }
}
