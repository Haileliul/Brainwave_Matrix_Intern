import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class news_hrizontalcard extends StatelessWidget {
  final String title;
  final String content;
  final String imageUrl;
  final String date;
  const news_hrizontalcard(
      {super.key,
      required this.size,
      required this.title,
      required this.content,
      required this.imageUrl,
      required this.date});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/detailed', arguments: {
          'title': title,
          'content': content,
          'imageUrl': imageUrl,
          'date': date,
        });
      },
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 1,
              blurStyle: BlurStyle.normal,
              color: Colors.grey,
              offset: Offset(0, 2),
              spreadRadius: 1,
            ),
          ],
          color: Colors.white,
        ),
        margin: EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            SizedBox(
              width: size.width * 0.3,
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  SizedBox(
                    height: double.infinity,
                    width: size.width * 0.3,
                    child: CachedNetworkImage(
                      imageUrl: imageUrl,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) =>
                              CircularProgressIndicator(
                                  value: downloadProgress.progress),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    width: 80,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 2.0),
                      child: Text(
                        date,
                        textAlign: TextAlign.end,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Container(
                  // color: Colors.red,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 8.0,
                      top: 8.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onSecondary,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 2.0),
                          child: Stack(
                            children: [
                              // Full content with clipped height
                              SizedBox(
                                height: 60, // Limit the height of the content
                                child: SingleChildScrollView(
                                  physics: const NeverScrollableScrollPhysics(),
                                  child: Text(
                                    content,
                                    style: const TextStyle(fontSize: 10),
                                  ),
                                ),
                              ),
                              // Fade effect
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  height: 20, // Height of the fade effect
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.white
                                            .withOpacity(0.0), // Transparent
                                        Colors.white, // Solid color
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
