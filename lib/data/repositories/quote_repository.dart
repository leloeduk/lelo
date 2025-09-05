import 'dart:convert';
import 'package:flutter/services.dart';
import '../../models/quote_model.dart';

class QuoteRepository {
  /// Charge toutes les citations depuis le fichier assets/quotes.json
  Future<List<Quote>> loadQuotesFromAssets() async {
    try {
      final data = await rootBundle.loadString('assets/quotes.json');
      final Map<String, dynamic> jsonResult = json.decode(data);

      final List<dynamic> quotesJson = jsonResult['quotes'];
      final quotes = quotesJson.map((q) => Quote.fromJson(q)).toList();
      return quotes;
    } catch (e) {
      throw Exception('Erreur lors du chargement des citations: $e');
    }
  }
}
