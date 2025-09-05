import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/quote_bloc.dart';
import '../../bloc/quote_event.dart';
import '../../bloc/quote_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final quoteBloc = BlocProvider.of<QuoteBloc>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Quotes App')),
      body: BlocBuilder<QuoteBloc, QuoteState>(
        builder: (context, state) {
          if (state is QuoteLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is QuoteLoaded) {
            final quotes = state.quotes;
            return ListView.builder(
              itemCount: quotes.length,
              itemBuilder: (context, index) {
                final quote = quotes[index];
                final isFavorite = state.favorites.any((q) => q.id == quote.id);

                return ListTile(
                  title: Text(quote.text),
                  subtitle: Text(quote.author),
                  trailing: IconButton(
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.red : null,
                    ),
                    onPressed: () {
                      if (isFavorite) {
                        quoteBloc.add(RemoveFavorite(quote));
                      } else {
                        quoteBloc.add(AddFavorite(quote));
                      }
                    },
                  ),
                );
              },
            );
          } else if (state is QuoteError) {
            return Center(child: Text(state.message));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
