// Project imports:

/// Configuration options for adjusting image properties like brightness,
/// contrast, and temperature.
///
/// `ImageAdjustmentConfigs` allows you to define settings for image adjustments,
/// including brightness, contrast, and temperature levels.
class ImageAdjustmentConfigs {
  /// Creates an instance of `ImageAdjustmentConfigs` with optional settings.
  ///
  /// By default, brightness, contrast, and temperature are set to 1.0 (neutral).
  const ImageAdjustmentConfigs({
    this.brightness = 1.0,
    this.contrast = 1.0,
    this.temperature = 1.0,
  });

  /// The brightness level of the image.
  ///
  /// Default is 1.0 (neutral), where 0.0 is completely dark, and values above 1.0 make the image brighter.
  final double brightness;

  /// The contrast level of the image.
  ///
  /// Default is 1.0 (neutral), where 0.0 removes contrast, and values above 1.0 increase contrast.
  final double contrast;

  /// The temperature level of the image.
  ///
  /// Default is 1.0 (neutral), where values below 1.0 make the image cooler, and values above 1.0 make it warmer.
  final double temperature;

  /// Creates a copy of this `ImageAdjustmentConfigs` object with the given fields
  /// replaced with new values.
  ///
  /// The [copyWith] method allows you to create a new instance of
  /// [ImageAdjustmentConfigs] with some properties updated while keeping the
  /// others unchanged.
  ImageAdjustmentConfigs copyWith({
    double? brightness,
    double? contrast,
    double? temperature,
  }) {
    return ImageAdjustmentConfigs(
      brightness: brightness ?? this.brightness,
      contrast: contrast ?? this.contrast,
      temperature: temperature ?? this.temperature,
    );
  }
}
