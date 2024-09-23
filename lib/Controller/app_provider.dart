
import 'dart:io';

import 'package:flutter/foundation.dart';

class AppProvider extends ChangeNotifier{
  late File _imageFile;
  File get imageFile => _imageFile;

  set imageFile(File image) {
    _imageFile = image;
    notifyListeners();
  }
}