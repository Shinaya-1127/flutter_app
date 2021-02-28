import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model/image_picker_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker Example'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ChangeNotifierProvider<CameraModel>(
                create: (_) => CameraModel(),
                child: Container(
                    width: 300,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [Camera(),Gallery()],
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Camera extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cameraProvider = Provider.of<CameraModel>(context);
    return FloatingActionButton(
      onPressed: () {
        cameraProvider.getImageFromCamera();
      },
      tooltip: 'Pick Image From Camera',
      child: Icon(Icons.add_a_photo),
    );
  }
}

class Gallery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final galleryProvider = Provider.of<CameraModel>(context);
    return FloatingActionButton(
      onPressed: () {
        galleryProvider.getImageFromGallery();
      },
      tooltip: 'Pick Image From Gallery',
      child: Icon(Icons.photo_library),
    );
  }
}

