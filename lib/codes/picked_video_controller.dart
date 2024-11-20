import 'package:flutter/cupertino.dart';
import 'dart:html' as html;

///Throws exception if used in android apps
class WebPickedVideoController extends ChangeNotifier {
  List<html.File> _data = [];
  int? _currentPlayingIndex;

  int? get currentPlayingIndex {
    final c = _currentPlayingIndex;
    if (c == null) return null;
    if (c < _data.length) {
      return c;
    }
    return null;
  }

  List<html.File> get data => List.unmodifiable(_data);

  html.File? mayGetCurrentVideo() {
    final current=_currentPlayingIndex;
    if(current==null)return null;
    return _data.elementAtOrNull(current);
  }

  void add(html.File newVideo) {
    _data = [..._data, newVideo];
    notifyListeners();
  }

  void remove(int index) {
    final value = [..._data];
    value.removeAt(index);
    _data = value;
    notifyListeners();
  }

  void play(int index) {
    _currentPlayingIndex = index;
    notifyListeners();
  }
}
