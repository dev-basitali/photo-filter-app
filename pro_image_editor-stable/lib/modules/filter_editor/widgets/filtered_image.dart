/// Dart imports:
import 'dart:ui';

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:pro_image_editor/pro_image_editor.dart';
import '../../../widgets/auto_image.dart';
import '../types/filter_matrix.dart';
import 'filter_generator.dart';

/// Represents an image where filters and blur factors can be applied.
class FilteredImage extends StatefulWidget {
  /// Constructor for creating an instance of FilteredImage.
  const FilteredImage({
    super.key,
    required this.width,
    required this.height,
    required this.configs,
    required this.filters,
    required this.image,
    required this.blurFactor,
    this.fit = BoxFit.contain,
    required this.colorFilterMatrix,
  });

  /// The width of the image.
  final double width;

  /// The height of the image.
  final double height;

  /// A class representing configuration options for the Image Editor.
  final ProImageEditorConfigs configs;

  /// The list of filters to be applied on the image.
  final FilterMatrix filters;

  /// The editor image to display.
  final EditorImage image;

  /// How the image should be inscribed into the space allocated for it.
  final BoxFit fit;

  /// The blur factor.
  final double blurFactor;

  /// The color filter matrix to be applied.
  final List<double> colorFilterMatrix;

  @override
  FilteredImageState createState() => FilteredImageState();
}

/// A stateful widget for displaying a filtered image
class FilteredImageState extends State<FilteredImage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          ColorFilterGenerator(
            filters: widget.filters,
            child: _buildImage(),
          ),
          // ClipRect(
          //   child: ColorFiltered(
          //     colorFilter: ColorFilter.matrix(widget.colorFilterMatrix),
          //     child: _buildImage(),
          //   ),
          // ),

          ClipRect(
            clipBehavior: Clip.hardEdge,
            child: BackdropFilter(
              filter: ImageFilter.blur(
                  sigmaX: widget.blurFactor, sigmaY: widget.blurFactor),
              child: Container(
                width: widget.width,
                height: widget.height,
                alignment: Alignment.center,
                color: Colors.white.withOpacity(0.0),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImage() {
    return AutoImage(
      widget.image,
      fit: widget.fit,
      width: widget.width,
      height: widget.height,
      configs: widget.configs,
    );
  }
}
