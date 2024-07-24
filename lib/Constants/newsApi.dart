import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Newsapi{
   static const baseurl = "https://newsapi.org/v2/top-headlines?";
   static const apikey= "";

   Future<news> getNews() async{
     final response= await http .get(Uri.parse(baseurl));

     if(response.statusCode == 200){
       return news.fromJson(jsonDecode(response.body)as Map<String, dynamic>);
     }
     else{
       throw Exception('Failed to get from server');
     }
   }
}

class news{

  final String author;
  final String title;
  final String imageUrl;
  final String content;
  final String date;

  const news({
    required this.author,
    required this.title,
    required this.imageUrl,
    required this.content,
    required this.date,
  });


  factory news.fromJson(Map<String, dynamic> json) {
    return switch (json){
      {
        'author': String author,
        'title': String title,
      'imageurl': String imageurl,
      'content': String content,
      'date': String date,
    } => news(
        author: author,
        title: title,
        imageUrl: imageurl,
        content: content,
        date: date,
      ),
    _ => throw const FormatException('Error occurred')
    };
  }
}