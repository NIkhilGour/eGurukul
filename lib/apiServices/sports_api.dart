import 'dart:convert';

import 'package:chat_app/model/news.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod/riverpod.dart';

class SportsApi
{
      Future<List<News>> fetchdata() async {
    final url = Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=in&category=sports&apiKey=468bc846dea74c1da514e2e40de6b7ef');

    final response = await http.get(url);

    var resData = json.decode(response.body);
    List<News> data = [];
    data.clear(); // this will remove the previous data before updating the list
    // as the build method execute again and if we do not remove the previous data.
    // data will be repeated
    if (response.statusCode == 200) {
      for (Map i in resData['articles']) {
        if (i['title'] != null &&
            i['description'] != null &&
            i['author'] != null &&
            i['urlToImage'] != null) {
          News news = News(
              title: i['title'],
              desc: i['description'] ??
                  'Description of this article is not available ',
              author: i['author'] ?? 'Not Available',
              image: i['urlToImage'] ??
                  'https://as1.ftcdn.net/v2/jpg/01/75/17/46/1000_F_175174631_fZWpQKTkvuuXxZN6rz7x7mzjwCrhJq0o.jpg',
              url: i['url']);
          data.add(news);
        }
      }

      return data;
    } else {
      return data;
    }
  }
}

final sportsnewsprovider = Provider<SportsApi>((ref) => SportsApi());