import 'package:equatable/equatable.dart';
import '../../models/quote_model.dart';

abstract class QuoteState extends Equatable {
  const QuoteState();

  @override
  List<Object?> get props => [];
}

class QuoteInitial extends QuoteState {}

class QuoteLoading extends QuoteState {}

class QuoteLoaded extends QuoteState {
  final List<Quote> quotes;
  final List<Quote> favorites;
  final Quote? randomQuote;
  final String? selectedCategory;

  const QuoteLoaded({
    required this.quotes,
    required this.favorites,
    this.randomQuote,
    this.selectedCategory,
  });

  QuoteLoaded copyWith({
    List<Quote>? quotes,
    List<Quote>? favorites,
    Quote? randomQuote,
    String? selectedCategory,
  }) {
    return QuoteLoaded(
      quotes: quotes ?? this.quotes,
      favorites: favorites ?? this.favorites,
      randomQuote: randomQuote ?? this.randomQuote,
      selectedCategory: selectedCategory ?? this.selectedCategory,
    );
  }

  @override
  List<Object?> get props => [quotes, favorites, randomQuote, selectedCategory];
}

class QuoteError extends QuoteState {
  final String message;
  const QuoteError(this.message);

  @override
  List<Object?> get props => [message];
}
