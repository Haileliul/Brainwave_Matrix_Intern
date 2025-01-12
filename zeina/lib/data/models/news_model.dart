class News {
  final String? title;
  final String? content;
  final String? img;
  final String? date;
  final String? link;

  News({
    required this.title,
    required this.content,
    required this.img,
    required this.date,
    required this.link,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      title: json['title'],
      content: json['content'],
      img: json['img'],
      date: json['date'],
      link: json['link'],
    );
  }
}
