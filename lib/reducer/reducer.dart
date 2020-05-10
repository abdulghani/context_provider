abstract class Reducer {
  Function _notifyListeners;

  void setNotifier(Function fn) {
    this._notifyListeners = fn;
  }

  void notifyListeners() {
    this._notifyListeners();
  }

  void dispatch(Map<String, dynamic> action) {
    // doesn't do anything yet
  }
}
