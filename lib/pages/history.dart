import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/my_app_state.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            'You have generated ${appState.history.length} words.',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        ...appState.history.map(
          (pair) => ListTile(
            title: Text(pair.asLowerCase),
          ),
        ),
      ],
    );
  }
}
