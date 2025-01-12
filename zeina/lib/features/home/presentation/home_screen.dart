import 'package:flutter/material.dart';
import 'package:zeina/features/home/presentation/sport_news.dart';
import 'package:zeina/features/home/presentation/technology_news.dart';
import '../../../data/repositories/news_repositories.dart';
import '../../../core/services/api_service.dart';
import 'genral_news.dart';
import 'business_news.dart';

class HomeScreen extends StatelessWidget {
  final NewsRepository repository = NewsRepository(ApiService());

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),
        elevation: 10,
      ),
      body: Container(
        height: size.height,
        margin: EdgeInsets.symmetric(horizontal: 10),
        // color: Colors.purple,
        child: Column(
          children: [
            SizedBox(
                width: size.width,
                height: size.height * 0.1,
                // color: Colors.red,
                child: Text("this is place for add")),
            Expanded(
              child: SizedBox(
                child: SingleChildScrollView(
                  child: Container(
                    // color: Colors.green,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: size.width,
                          height: 200,
                          decoration: BoxDecoration(
                              // color: Colors.amber,
                              ),
                          child: GeneralNews(repository: repository),
                        ),
                        Container(
                          width: size.width,
                          decoration: BoxDecoration(
                              // color: Colors.blue,
                              ),
                          child: Column(
                            children: [
                              SizedBox(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20.0),
                                      child: Text(
                                        "Technology News",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    TechnologyNews(repository: repository),
                                  ],
                                ),
                              ),
                              SizedBox(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0),
                                      child: Text(
                                        "Bussines News",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    BusinessNews(repository: repository),
                                  ],
                                ),
                              ),
                              SizedBox(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0),
                                      child: Text(
                                        "Sport News",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    SportsNews(repository: repository),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            /*   GeneralNews(repository: repository), */
          ],
        ),
      ),
    );
  }
}
