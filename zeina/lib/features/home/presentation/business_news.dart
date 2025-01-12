import 'package:flutter/material.dart';
import '../../../core/widgets/news_horizontalcard.dart';
import '../../../data/repositories/news_repositories.dart';
import 'package:shimmer/shimmer.dart';
import '../../../core/utils/Shimmer_Placeholder.dart';

class BusinessNews extends StatelessWidget {
  const BusinessNews({
    super.key,
    required this.repository,
  });

  final NewsRepository repository;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder(
      future: repository.getbusinessNews(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SizedBox(
            height: size.height * 0.7,
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: 6,
              itemBuilder: (context, index) {
                return Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  enabled: true,
                  child: Container(
                    height: size.height * 0.15,
                    margin: EdgeInsets.only(bottom: 5),
                    decoration: BoxDecoration(
                      // color: Colors.grey.shade300,
                      border: Border.all(
                        color: Colors.grey.shade300,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ContentPlaceholder(
                      lineType: ContentLineType.threeLines,
                    ),
                  ),
                );
              },
            ),
          );
        } else if (snapshot.hasError) {
          return Center(child: Text('Error loading news: ${snapshot.error}'));
        } else {
          final newsList = snapshot.data as List;
          return ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: 100,
              maxHeight: size.height * 1.2,
              minWidth: size.width,
              maxWidth: size.width,
            ), // Ensure bounded height
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: newsList.length,
              itemBuilder: (context, index) {
                final news = newsList[index];
                return news_hrizontalcard(
                  size: size,
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
