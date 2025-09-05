import 'package:hive/hive.dart';

part 'quote_model.g.dart';

@HiveType(typeId: 0)
class Quote extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String text;

  @HiveField(2)
  final String author;

  @HiveField(3)
  final String category;

  @HiveField(4)
  final String? verse;

  @HiveField(5)
  final String? testimony;

  @HiveField(6)
  final String lang; // fr/en

  @HiveField(7)
  final List<String> tags;

  @HiveField(8)
  final DateTime createdAt;

  Quote({
    required this.id,
    required this.text,
    required this.author,
    required this.category,
    this.verse,
    this.testimony,
    required this.lang,
    required this.tags,
    required this.createdAt,
  });

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      id: json['id'],
      text: json['text'],
      author: json['author'],
      category: json['category'],
      verse: json['verse'],
      testimony: json['testimony'],
      lang: json['lang'],
      tags: List<String>.from(json['tags']),
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "text": text,
      "author": author,
      "category": category,
      "verse": verse,
      "testimony": testimony,
      "lang": lang,
      "tags": tags,
      "created_at": createdAt.toIso8601String(),
    };
  }
}
