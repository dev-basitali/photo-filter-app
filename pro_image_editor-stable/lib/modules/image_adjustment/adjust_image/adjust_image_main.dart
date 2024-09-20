// color_filtered_widget.dart
import 'dart:io';

import 'package:flutter/material.dart';

import '../../../models/editor_image.dart';
import 'adjust_image.dart';
///
class ColorFilteredWidget extends StatelessWidget {
///
  const ColorFilteredWidget({super.key,
    required this.brightness,
    required this.contrast,
    required this.temperature,
    required this.editorImage,
  });
  ///
  final double brightness;
  ///
  final double contrast;
  ///
  final double temperature;
  ///
  final EditorImage editorImage;
  @override
  Widget build(BuildContext context) {
    List<double> brightnessMatrix = ImageAdjustments.brightness(brightness);
    List<double> contrastMatrix = ImageAdjustments.contrast(contrast);
    List<double> temperatureMatrix = ImageAdjustments.temperature(temperature);

    List<double> combinedMatrix = List.generate(20, (index) => 0);

    for (int i = 0; i < 4; i++) {
      for (int j = 0; j < 5; j++) {
        combinedMatrix[i * 5 + j] = brightnessMatrix[i * 5 + j] +
            contrastMatrix[i * 5 + j] +
            temperatureMatrix[i * 5 + j];
      }
    }

    return ColorFiltered(
      colorFilter: ColorFilter.matrix(combinedMatrix),
      child: Image.file(File(editorImage.toString())),
    );
  }
}
