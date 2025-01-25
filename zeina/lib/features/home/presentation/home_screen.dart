import 'dart:async';

import 'package:flutter/material.dart';
import 'package:zeina/features/home/presentation/sport_news.dart';
import 'package:zeina/features/home/presentation/technology_news.dart';
import 'package:popover/popover.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import '../../../data/repositories/news_repositories.dart';
import '../../../core/services/api_service.dart';
import '../../../core/widgets/overpopup.dart';
import 'genral_news.dart';
import 'business_news.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final NewsRepository repository = NewsRepository(ApiService());
  StreamSubscription? _internetStreamSubscription;
  bool isConnected = false;
  @override
  initState() {
    _internetStreamSubscription =
        InternetConnection().onStatusChange.listen((InternetStatus status) {
      if (status == InternetStatus.connected) {
        setState(() {
          isConnected = true;
        });
      } else {
        setState(() {
          isConnected = false;
        });
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _internetStreamSubscription?.cancel();
    super.dispose();
  }

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
            Stack(
              children: [
                SizedBox(
                  width: size.width,
                  height: size.height * 0.1,
                  // color: Colors.red,
                  child: Text("this is place for add"),
                ),
                Positioned(
                  right: 0,
                  child: Builder(
                    builder: (context) => IconButton(
                      icon: Icon(
                        Icons.language,
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                      onPressed: () => showPopover(
                        context: context,
                        bodyBuilder: (context) => LangPopup(),
                        onPop: () => print('Popover was popped!'),
                        direction: PopoverDirection.right,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
                child: isConnected
                    ? SizedBox(
                        child: SingleChildScrollView(
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 20.0),
                                            child: Text(
                                              "Technology News",
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onSecondary,
                                              ),
                                            ),
                                          ),
                                          TechnologyNews(
                                              repository: repository),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 20.0),
                                            child: Text(
                                              "Bussines News",
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onSecondary,
                                              ),
                                            ),
                                          ),
                                          BusinessNews(repository: repository),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 20.0),
                                            child: Text(
                                              "Sport News",
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onSecondary,
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
                      )
                    : SizedBox(
                        width: size.width,
                        height: size.height,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.wifi_off,
                                size: 50,
                                color:
                                    Theme.of(context).colorScheme.onSecondary,
                              ),
                              Text(
                                "No Internet Connection",
                                style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onSecondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),

            /*   GeneralNews(repository: repository), */
          ],
        ),
      ),
    );
  }
}
