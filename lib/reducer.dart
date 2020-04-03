abstract class Reducer {
  Function _notifyListeners;
  Function _stateDispatch;
  Function _useSelector;

  void setNotifier(Function fn) {
    this._notifyListeners = fn;
  }

  void notifyListeners() {
    this._notifyListeners();
  }

  void setStateDispatch(Function fn) {
    this._stateDispatch = fn;
  }

  void stateDispatch(Map<String, dynamic> action) {
    this._stateDispatch(action);
  }

  void dispatch(Map<String, dynamic> action) {
    // doesn't do anything yet
  }

  void setSelector(Function fn) {
    this._useSelector = fn;
  }

  T useSelector<T extends Reducer>() {
    return this._useSelector<T>();
  }
}
