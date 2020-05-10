import 'package:context_provider/context_provider.dart';
import 'package:context_provider/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Store extends ChangeNotifier {
  Map<Type, Reducer> _states;

  Store(this._states) {
    this._states.forEach((t, state) {
      this._states[t].setNotifier(super.notifyListeners);
      this._states[t].dispatch({"type": INIT});
    });
  }

  void dispatch(Map<String, dynamic> action) {
    this._states.forEach((t, state) {
      this._states[t].dispatch(action);
    });
  }

  T getState<T extends Reducer>() {
    return this._states[T];
  }
}

Store createStore(Map<Type, Reducer> states) {
  return Store(states);
}

T useSelector<T extends Reducer>(BuildContext context, {bool listen = true}) {
  final Store store = Provider.of<Store>(context, listen: listen);
  return store.getState<T>();
}

Function useDispatch(BuildContext context, {bool listen = false}) {
  final Store store = Provider.of<Store>(context, listen: listen);
  return store.dispatch;
}
