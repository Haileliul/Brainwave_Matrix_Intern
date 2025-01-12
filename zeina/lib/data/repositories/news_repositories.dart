import '../../core/services/api_service.dart';
import '../models/news_model.dart';
import '../../core/constants/urls.dart';

class NewsRepository {
  final ApiService apiService;

  NewsRepository(this.apiService);

  Future<List<News>> getGeneralNews() async {
    final data = await apiService.fetchGeneralNews(Urls.generalNewsEndpoint);
    return data.map<News>((json) => News.fromJson(json)).toList();
  }

  Future<List<News>> getbusinessNews() async {
    final data = await apiService.fetchGeneralNews(Urls.businessNewsEndpoint);
    return data.map<News>((json) => News.fromJson(json)).toList();
  }

  Future<List<News>> gettechnologyNews() async {
    final data = await apiService.fetchGeneralNews(Urls.technologyNewsEndpoint);
    return data.map<News>((json) => News.fromJson(json)).toList();
  }

  Future<List<News>> getsportsNews() async {
    final data = await apiService.fetchGeneralNews(Urls.sportsNewsEndpoint);
    return data.map<News>((json) => News.fromJson(json)).toList();
  }

// Afaan Oromoo (Oromo) News

  Future<List<News>> getoromoGeneralNews() async {
    final data =
        await apiService.fetchGeneralNews(Urls.oromoGeneralNewsEndpoint);
    return data.map<News>((json) => News.fromJson(json)).toList();
  }

  Future<List<News>> getoromoBusinessNews() async {
    final data =
        await apiService.fetchGeneralNews(Urls.oromoBusinessNewsEndpoint);
    return data.map<News>((json) => News.fromJson(json)).toList();
  }

  Future<List<News>> getoromoTechnologyNews() async {
    final data =
        await apiService.fetchGeneralNews(Urls.oromoTechnologyNewsEndpoint);
    return data.map<News>((json) => News.fromJson(json)).toList();
  }

  Future<List<News>> getoromoSportsNews() async {
    final data =
        await apiService.fetchGeneralNews(Urls.oromoSportsNewsEndpoint);
    return data.map<News>((json) => News.fromJson(json)).toList();
  }

  // Tigrinya News

  Future<List<News>> gettigrinyaGeneralNews() async {
    final data =
        await apiService.fetchGeneralNews(Urls.tigrinyaGeneralNewsEndpoint);
    return data.map<News>((json) => News.fromJson(json)).toList();
  }

  Future<List<News>> gettigrinyaBusinessNews() async {
    final data =
        await apiService.fetchGeneralNews(Urls.tigrinyaBusinessNewsEndpoint);
    return data.map<News>((json) => News.fromJson(json)).toList();
  }

  Future<List<News>> gettigrinyaTechnologyNews() async {
    final data =
        await apiService.fetchGeneralNews(Urls.tigrinyaTechnologyNewsEndpoint);
    return data.map<News>((json) => News.fromJson(json)).toList();
  }

  Future<List<News>> gettigrinyaSportsNews() async {
    final data =
        await apiService.fetchGeneralNews(Urls.tigrinyaSportsNewsEndpoint);
    return data.map<News>((json) => News.fromJson(json)).toList();
  }
}
