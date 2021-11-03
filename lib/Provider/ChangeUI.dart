import 'package:flutter/material.dart';

class UIProvider extends ChangeNotifier {
  bool _isListView = true;
  bool get isListView => _isListView;
  toggleView() {
    _isListView = !_isListView;
    notifyListeners();
  }
}
