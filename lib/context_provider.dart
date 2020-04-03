library context_provider;

import 'package:context_provider/reducer.dart';
import 'package:context_provider/store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContextProvider extends StatelessWidget {
  ContextProvider({this.reducer, this.child});

  final Map<Type, Reducer> reducer;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => createStore(this.reducer),
      child: this.child,
    );
  }
}
