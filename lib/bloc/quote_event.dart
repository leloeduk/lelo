import 'package:equatable/equatable.dart';
import '../../models/quote_model.dart';

abstract class QuoteEvent extends Equatable {
  const QuoteEvent();

  @override
  List<Object?> get props => [];
}

// Charger toutes les citations depuis JSON
class LoadQuotes extends QuoteEvent {}

// Ajouter une citation en favoris
class AddFavorite extends QuoteEvent {
  final Quote quote;
  const AddFavorite(this.quote);

  @override
  List<Object?> get props => [quote];
}

// Retirer une citation des favoris
class RemoveFavorite extends QuoteEvent {
  final Quote quote;
  const RemoveFavorite(this.quote);

  @override
  List<Object?> get props => [quote];
}

// Obtenir une citation aléatoire
class GetRandomQuote extends QuoteEvent {}

// Filtrer par catégorie
class FilterByCategory extends QuoteEvent {
  final String category;
  const FilterByCategory(this.category);

  @override
  List<Object?> get props => [category];
}

class SendDailyQuoteNotification extends QuoteEvent {
  final Quote quote;
  const SendDailyQuoteNotification(this.quote);

  @override
  List<Object?> get props => [quote];
}
