// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:api_news_app/data_file/category_data.dart';
import 'package:api_news_app/data_file/news.dart';
import 'package:api_news_app/models/article_model.dart';
import 'package:api_news_app/models/category_model.dart';
import 'package:api_news_app/view/category_screen.dart';
import 'package:api_news_app/view/widgets/articleTile.dart';
import 'package:api_news_app/view/widgets/categoryTile.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
 const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> category = [];

  List<ArticleModel> article = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    category = getCaegories();
    getNews();
  }

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    article = newsClass.news;

    setState(() {
      _loading = false;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter News",style: TextStyle(color: Colors.amber),),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.transparent,

      ),
      body: _loading? Center(
        child: CircularProgressIndicator() ,
      ) : Padding(
        padding: const EdgeInsets.only(right: 10,left: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 70,
                child: ListView.builder(
                  itemCount: category.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return CategoryTile(
                      categoryName: category[index].title,
                      imageUrl: category[index].urlToImage,
                    );
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 10),
                child: ListView.builder(
                  itemCount: article.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ArticleTile(
                      imageUrl: article[index].urlToImage,
                      title: article[index].title ,
                      description: article[index].description,
                      url: article[index].url,

                    );
                  },
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}


