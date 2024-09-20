// image_adjustments.dart
///
class ImageAdjustments {
  /// Adjust brightness
  static List<double> brightness(double value) {
    value = value * 255; // Adjust scaling for practical use
    return [
      1, 0, 0, 0, value,
      0, 1, 0, 0, value,
      0, 0, 1, 0, value,
      0, 0, 0, 1, 0
    ];
  }

  /// Adjust contrast
  static List<double> contrast(double value) {
    double adj = value * 255;
    double factor = (259 * (adj + 255)) / (255 * (259 - adj));
    double offset = 128 * (1 - factor);
    return [
      factor, 0, 0, 0, offset,
      0, factor, 0, 0, offset,
      0, 0, factor, 0, offset,
      0, 0, 0, 1, 0
    ];
  }

  /// Adjust temperature
  static List<double> temperature(double value) {
    double rFactor = 1 + value * 0.5; // Warmer
    double bFactor = 1 - value * 0.3; // Cooler
    return [
      rFactor, 0, 0, 0, 0,
      0, 1, 0, 0, 0,
      0, 0, bFactor, 0, 0,
      0, 0, 0, 1, 0
    ];
  }
}
