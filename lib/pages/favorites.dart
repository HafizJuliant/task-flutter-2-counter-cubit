import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/my_app_state.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            'You have ${appState.favorites.length} favorite words.',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        ...appState.favorites.map(
          (pair) => ListTile(
            title: Text(pair.asLowerCase),
            onTap: () {
              final snackBar = SnackBar(
                content: Text("It's ${pair.asLowerCase}!"),
                duration: const Duration(seconds: 2),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
          ),
        ),
      ],
    );
  }
}
