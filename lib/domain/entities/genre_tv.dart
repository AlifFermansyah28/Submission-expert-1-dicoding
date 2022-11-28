import 'dart:convert';
import 'package:ditonton/data/models/genre_model.dart';
import '../../domain/entities/genre_tv.dart';
import 'package:equatable/equatable.dart';


class genretv extends Equatable {
  genretv({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;


  @override
  List<Object> get props => [id, name];
}
