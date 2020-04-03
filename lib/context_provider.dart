library context_provider;

import 'package:context_provider/reducer.dart';
import 'package:context_provider/store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContextProvider extends StatelessWidget {
  ContextProvider({this.states, this.child});

  final Map<Type, Reducer> states;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => createStore(this.states),
      child: this.child,
    );
  }
}
