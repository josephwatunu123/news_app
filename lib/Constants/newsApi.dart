import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Newsapi{
   static const baseurl = "https://newsapi.org/v2/top-headlines?";
   static const apikey= "4e3c52af12a94c598b6046e3e71d73e6";

   Future<List<news>> GetNews() async{
     final response= await http .get(Uri.parse('${baseurl}apikey=$apikey&country=us'));

     if(response.statusCode == 200){
       List<dynamic> data = jsonDecode(response.body)['articles'];
       print(data);
       return data.map((article)=> news.fromJson(article)).toList();
     }
     else{
       throw Exception('Failed to get from server');
     }
   }
}

class news{

  final String? author;
  final String? title;
  final String? imageUrl;
  final String? content;
  final String? date;

  const news({
    required this.author,
    required this.title,
    required this.imageUrl,
    required this.content,
    required this.date,
  });


  factory news.fromJson(Map<String, dynamic> json) {
    return news(
      author: json['author'],
      title: json['title'] ?? 'No title',
      imageUrl: json['urlToImage'],
      content: json['content']?? 'Content was null',
      date: json['publishedAt'] ?? '',
    );
  }
}