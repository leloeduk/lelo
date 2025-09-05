import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import '../../models/quote_model.dart';
import 'quote_event.dart';
import 'quote_state.dart';

class QuoteBloc extends Bloc<QuoteEvent, QuoteState> {
  final Box<Quote> favoritesBox;
  final List<Quote> _allQuotes;

  QuoteBloc({required this.favoritesBox, required List<Quote> initialQuotes})
    : _allQuotes = initialQuotes,
      super(QuoteInitial()) {
    on<LoadQuotes>(_onLoadQuotes);
    on<AddFavorite>(_onAddFavorite);
    on<RemoveFavorite>(_onRemoveFavorite);
    on<GetRandomQuote>(_onGetRandomQuote);
    on<FilterByCategory>(_onFilterByCategory);
  }

  void _onLoadQuotes(LoadQuotes event, Emitter<QuoteState> emit) async {
    try {
      emit(QuoteLoading());

      final favorites = favoritesBox.values.toList();

      emit(QuoteLoaded(quotes: _allQuotes, favorites: favorites));
    } catch (e) {
      emit(QuoteError("Erreur lors du chargement : $e"));
    }
  }

  void _onAddFavorite(AddFavorite event, Emitter<QuoteState> emit) async {
    if (state is QuoteLoaded) {
      final currentState = state as QuoteLoaded;

      await favoritesBox.put(event.quote.id, event.quote);

      emit(currentState.copyWith(favorites: favoritesBox.values.toList()));
    }
  }

  void _onRemoveFavorite(RemoveFavorite event, Emitter<QuoteState> emit) async {
    if (state is QuoteLoaded) {
      final currentState = state as QuoteLoaded;

      await favoritesBox.delete(event.quote.id);

      emit(currentState.copyWith(favorites: favoritesBox.values.toList()));
    }
  }

  void _onGetRandomQuote(GetRandomQuote event, Emitter<QuoteState> emit) {
    if (state is QuoteLoaded) {
      final currentState = state as QuoteLoaded;
      final random = Random();
      final randomQuote = _allQuotes[random.nextInt(_allQuotes.length)];

      emit(currentState.copyWith(randomQuote: randomQuote));
    }
  }

  void _onFilterByCategory(FilterByCategory event, Emitter<QuoteState> emit) {
    if (state is QuoteLoaded) {
      final currentState = state as QuoteLoaded;
      final filtered = _allQuotes
          .where(
            (q) => q.category.toLowerCase() == event.category.toLowerCase(),
          )
          .toList();

      emit(
        currentState.copyWith(
          quotes: filtered,
          selectedCategory: event.category,
        ),
      );
    }
  }
}
