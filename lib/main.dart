import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'bloc/quote_bloc.dart';
import 'bloc/quote_event.dart';
import 'models/quote_model.dart';
import 'data/repositories/quote_repository.dart';
import 'presentation/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(QuoteAdapter());
  final favoritesBox = await Hive.openBox<Quote>('favorites');

  // Charger les quotes depuis JSON
  final repository = QuoteRepository();
  final quotes = await repository.loadQuotesFromAssets();

  runApp(MyApp(favoritesBox: favoritesBox, initialQuotes: quotes));
}

class MyApp extends StatelessWidget {
  final Box<Quote> favoritesBox;
  final List<Quote> initialQuotes;

  const MyApp({
    super.key,
    required this.favoritesBox,
    required this.initialQuotes,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          QuoteBloc(favoritesBox: favoritesBox, initialQuotes: initialQuotes)
            ..add(LoadQuotes()), // on charge les quotes dès le lancement
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Quotes App',
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.system,
        home: const HomeScreen(),
      ),
    );
  }
}
