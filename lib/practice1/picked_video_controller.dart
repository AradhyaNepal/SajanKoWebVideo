import 'package:flutter/cupertino.dart';
import 'dart:html' as html;

///Throws exception if used in android apps
class WebPickedVideoController extends ChangeNotifier {
  List<html.File> _data = [];

  List<html.File> get data => List.unmodifiable(_data);

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
}