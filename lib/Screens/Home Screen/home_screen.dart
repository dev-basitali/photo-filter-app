import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pro_image_editor/modules/filter_editor/filter_editor.dart';
import 'package:pro_image_editor/modules/filter_editor/utils/filter_generator/filter_model.dart';
import 'package:pro_image_editor/modules/filter_editor/utils/filter_generator/filter_presets.dart';

import '../Edit Image/edit_image.dart';


class HomeScreen extends StatefulWidget {
  final List<CameraDescription> cameras;

  const HomeScreen({super.key, required this.cameras});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  final ImagePicker _picker = ImagePicker();

  bool _isGalleryMode = false;
  late int _selectedCameraIndex;
  bool _showFilters = false;

  ColorFilter? _selectedFilter;

  @override
  void initState() {
    super.initState();
    _selectedCameraIndex = 0;
    _requestStoragePermission();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    _controller = CameraController(
      widget.cameras[_selectedCameraIndex],
      ResolutionPreset.high,
    );
    _initializeControllerFuture = _controller.initialize();
    setState(() {});
  }

  Future<void> _requestStoragePermission() async {
    final status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }
  }

  void _flipCamera() {
    _selectedCameraIndex = (_selectedCameraIndex + 1) % widget.cameras.length;
    _initializeCamera();
  }

  Future<void> _pickImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _isGalleryMode = true;
      });
      _editImage(pickedFile.path);
    }
  }

  Future<void> _captureImage() async {
    try {
      await _initializeControllerFuture;
      final image = await _controller.takePicture();
      setState(() {
        _isGalleryMode = true;
      });
      _editImage(image.path);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to capture image: $e')),
      );
    }
  }

  Future<void> _editImage(String imagePath) async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            ImageEditorScreen(imagePath: imagePath, cameras: widget.cameras),
      ),
    );
  }

  void _toggleFilters() {
    setState(() {
      _showFilters = !_showFilters;
    });
  }

  void _applyFilter(ColorFilter filter) {
    setState(() {
      _selectedFilter = filter;
      _showFilters = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isGalleryMode
          ? Container()
          : Stack(
        children: [
          FutureBuilder<void>(
            future: _initializeControllerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return ColorFiltered(
                  colorFilter: _selectedFilter ??
                      const ColorFilter.mode(
                        Colors.transparent,
                        BlendMode.multiply,
                      ),
                  child: CameraPreview(_controller),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
          if (_showFilters)
            Positioned(
              bottom: 200,
              left: 0,
              right: 0,
              child: SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: presetFiltersList.length,
                  itemBuilder: (context, index) {
                    final filterModel = presetFiltersList[index];
                    return _buildFilterOption(filterModel);
                  },
                ),
              ),
            ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: _toggleFilters,
                icon: Image.asset(
                  'assets/Icons/filter.png',
                  height: 25,
                  color: Colors.white,
                ),
              ),
              Container(
                height: 150,
                color: Colors.black,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: _pickImageFromGallery,
                      icon: const Icon(
                        Icons.photo,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 10),
                    IconButton(
                      onPressed: _captureImage,
                      icon: const FaIcon(
                        FontAwesomeIcons.circle,
                        color: Colors.white,
                        size: 80,
                      ),
                    ),
                    const SizedBox(width: 10),
                    IconButton(
                      onPressed: _flipCamera,
                      icon: const FaIcon(
                        FontAwesomeIcons.cameraRotate,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Build a filter option from the `FilterModel`
  Widget _buildFilterOption(FilterModel filterModel) {
    return GestureDetector(
      onTap: () {
        _applyFilter(
          ColorFilter.matrix(filterModel.filters.isNotEmpty
              ? filterModel.filters.first
              : List<double>.filled(20, 0.0)),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: 60,
              width: 60,
              child: ColorFiltered(
                colorFilter: ColorFilter.matrix(
                  filterModel.filters.isNotEmpty
                      ? filterModel.filters.first
                      : List<double>.filled(20, 0.0),
                ),
                child: CameraPreview(_controller),
              ),
            ),
            Text(
              filterModel.name,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
