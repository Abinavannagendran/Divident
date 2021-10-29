import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DividentController extends ChangeNotifier {
  int count = 0;
  void itemCount(int item) {
    count = item;
    notifyListeners();
  }
}
