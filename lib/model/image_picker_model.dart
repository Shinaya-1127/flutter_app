import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraModel extends ChangeNotifier {
  File _image;
  final picker = ImagePicker();

  File get image {
    return _image;
  }

  Future<void> getImageFromCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    if (pickedFile != null) {
      _image = File(pickedFile.path);
    } else {
      print('画像が選択されていません');
    }
    notifyListeners();
  }

  Future<void> getImageFromGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _image = File(pickedFile.path);
    } else {
      print('画像が選択されていません');
    }
    notifyListeners();
  }
}