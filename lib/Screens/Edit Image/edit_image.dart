import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:photo_filter_app/Screens/Home%20Screen/home_screen.dart';
import 'package:pro_image_editor/pro_image_editor.dart';
// import 'package:pro_image_editor/models/editor_callbacks/pro_image_editor_callbacks.dart';
// import 'package:pro_image_editor/models/editor_configs/pro_image_editor_configs.dart';
// import 'package:pro_image_editor/modules/main_editor/main_editor.dart';


import 'package:provider/provider.dart';


import '../../Controller/app_provider.dart';

class ImageEditorScreen extends StatefulWidget {
  final File imagePath;
  final List<CameraDescription> cameras;

  const ImageEditorScreen({
    super.key,
    required this.imagePath,
    required this.cameras,
  });

  @override
  ImageEditorScreenState createState() => ImageEditorScreenState();
}

class ImageEditorScreenState extends State<ImageEditorScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text(
          'Edit Image',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: [
          BackButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (builder) => HomeScreen(
                    cameras: widget.cameras,
                  ),
                ),
              );
            },
          )
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (builder) => HomeScreen(
                  cameras: widget.cameras,
                ),
              ),
            );
          },
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: ProImageEditor.file(
        appProvider.imageFile,


          onImageEditingComplete: (Uint8List bytes) async {
            await _saveImageToDocuments(bytes, appProvider);

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (builder) => HomeScreen(
                  cameras: widget.cameras,
                ),
              )
            );
          },
          onCloseEditor: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (builder) => HomeScreen(
                  cameras: widget.cameras,
                ),
              ),
            ); // Return to the previous screen without saving
          },
        ),

    );
  }

  Future<void> _saveImageToDocuments(Uint8List bytes, AppProvider provider) async {
    try {
      final directory = await getExternalStorageDirectory();
      final cameraPath = path.join(directory!.path, 'edited_image.png');
      final file = File(cameraPath);
      await file.writeAsBytes(bytes);
      await ImageGallerySaver.saveImage(bytes);

      final originalImageFile = provider.imageFile;
      if (await originalImageFile.exists()) {
        await originalImageFile.delete();
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error saving image: $e');
      }
    }
  }
}

