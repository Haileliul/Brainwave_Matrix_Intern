import "package:flutter/material.dart";
import '../../../core/widgets/news_card.dart';
import '../../../data/repositories/news_repositories.dart';

class GeneralNews extends StatelessWidget {
  const GeneralNews({
    super.key,
    required this.repository,
  });

  final NewsRepository repository;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: repository.getGeneralNews(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error loading news : ${snapshot.error}'));
        } else {
          final newsList = snapshot.data as List;
          return SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: newsList.length,
              itemBuilder: (context, index) {
                final news = newsList[index];
                return NewsCard(
                  title: news.title,
                  content: news.content,
                  imageUrl: news.img,
                  date: news.date,
                );
              },
            ),
          );
        }
      },
    );
  }
}
