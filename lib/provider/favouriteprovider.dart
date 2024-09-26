import 'package:flutter/material.dart';

class FavoritesProvider with ChangeNotifier {
  List<Map<String, dynamic>> favorites = [];

  void toggleFavorite(Map<String, dynamic> item) {
    if (favorites.contains(item)) {
      favorites.remove(item);
    } else {
      favorites.add(item);
    }
    notifyListeners();
  }

  bool isFavorite(Map<String, dynamic> item) {
    return favorites.contains(item);
  }
}
