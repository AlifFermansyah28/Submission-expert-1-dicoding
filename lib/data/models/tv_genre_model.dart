import 'package:ditonton/domain/entities/genre_tv.dart';
import 'package:ditonton/domain/entities/genre_tv.dart';
import 'package:equatable/equatable.dart';

class tvgnremdl extends Equatable {
  tvgnremdl({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  factory tvgnremdl.fromJson(Map<String, dynamic> json) => tvgnremdl(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };

  genretv toEntity() {
    return genretv(id: this.id, name: this.name);
  }

  @override
  List<Object?> get props => [id, name];
}
