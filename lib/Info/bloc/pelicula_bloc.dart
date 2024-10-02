import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/Info/model/product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:equatable/equatable.dart';

// Definimos los estados usando Equatable
abstract class MovieState{}

class MovieLoading extends MovieState {}

class MovieFailed extends MovieState {}

class MovieNew extends MovieState {
  final String data;

  MovieNew({required this.data});

  @override
  List<Object> get props => [data];
}

class MovieCubit extends Cubit<MovieState> {
  MovieCubit() : super(MovieLoading());
  
  final Dio _client = Dio(BaseOptions(baseUrl: 'https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&api_key=fa3e844ce31744388e07fa47c7c5d8c3',));
  
  Future<List<Movie>> getProducts() async {
    final response = await _client.get('');

    return (response.data as List)
      .map((json) => Movie(
            id: json['id'],
            title: json['title'],            
          ))
      .toList();
  }
}

