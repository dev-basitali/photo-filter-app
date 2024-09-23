import 'package:flutter/widgets.dart';
import 'package:pro_image_editor/models/editor_configs/pro_image_editor_configs.dart';

// Project imports:
import '../models/editor_image.dart';
import 'platform_circular_progress_indicator.dart';

/// A versatile widget for displaying images with various sources.
class AutoImage extends StatelessWidget {
  /// Creates an [AutoImage] widget with the specified image source and
  /// optional parameters.
  const AutoImage(
      this.image, {
        super.key,
        this.fit,
        this.width,
        this.height,
        required this.configs,
        this.colorFilterMatrix, // Added parameter for color filter matrix
      });

  /// The image to be displayed, wrapped as an [EditorImage].
  final EditorImage image;

  /// How the image should be inscribed into the space allocated for it.
  final BoxFit? fit;

  /// The preferred width of the image. If null, it will be determined by the
  /// parent widget.
  final double? width;

  /// The preferred height of the image. If null, it will be determined by the
  /// parent widget.
  final double? height;

  /// The design mode of the editor.
  final ProImageEditorConfigs configs;

  /// The matrix for applying color filters.
  final List<double>? colorFilterMatrix; // Added field for color filter matrix

  @override
  Widget build(BuildContext context) {
    Widget imageWidget;

    // Display the image based on its type.
    switch (image.type) {
      case EditorImageType.memory:
        imageWidget = Image.memory(
          image.byteArray!,
          fit: fit,
          width: width,
          height: height,
        );
        break;
      case EditorImageType.file:
        imageWidget = Image.file(
          image.file!,
          fit: fit,
          width: width,
          height: height,
        );
        break;
      case EditorImageType.network:
        imageWidget = Image.network(
          image.networkUrl!,
          fit: fit,
          width: width,
          height: height,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) {
              return child;
            } else {
              // Display a circular progress indicator while the image is
              // loading.
              return Center(
                child: PlatformCircularProgressIndicator(configs: configs),
              );
            }
          },
        );
        break;
      case EditorImageType.asset:
        imageWidget = Image.asset(
          image.assetPath!,
          fit: fit,
          width: width,
          height: height,
        );
        break;
    }

    // Apply the color filter if provided
    if (colorFilterMatrix != null) {
      return ColorFiltered(
        colorFilter: ColorFilter.matrix(colorFilterMatrix!),
        child: imageWidget,
      );
    }

    // Return the image widget without color filter if not provided
    return imageWidget;
  }
}
