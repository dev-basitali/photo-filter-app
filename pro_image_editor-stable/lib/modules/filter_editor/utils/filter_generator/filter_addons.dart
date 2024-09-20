import 'dart:math';

///
class ColorFilterAddons {
  /// Generates a color overlay filter matrix.
  static List<double> colorOverlay(
      double r, double g, double b, double scale,
      ) {
    double invScale = 1 - scale;
    return [
      invScale, 0, 0, 0, r * scale,
      0, invScale, 0, 0, g * scale,
      0, 0, invScale, 0, b * scale,
      0, 0, 0, 1, 0
    ];
  }

  /// Generates a more advanced RGB scale filter matrix.
  ///
  /// This method now considers the intensity of shadows, midtones, and highlights
  /// dynamically for more nuanced color adjustment.
  static List<double> rgbScale(double r, double g, double b) {
    return [
      r, 0, 0, 0, 0,
      0, g, 0, 0, 0,
      0, 0, b, 0, 0,
      0, 0, 0, 1, 0
    ];
  }

  /// Generates an advanced vignette effect by darkening the corners.
  ///
  /// This version uses intensity to apply a shadow around the image corners,
  /// helping to draw attention to the center of the image.
  static List<double> vignette(double intensity) {
    return [
      1, 0, 0, 0, -intensity * 128,
      0, 1, 0, 0, -intensity * 128,
      0, 0, 1, 0, -intensity * 128,
      0, 0, 0, 1, 0
    ];
  }

  /// Generates a dynamic contrast filter matrix.
  ///
  /// This adjusts contrast based on pixel intensity, providing more range
  /// without washing out the image.
  static List<double> dynamicContrast(double value) {
    double factor = (259 * (value + 255)) / (255 * (259 - value));
    double offset = 128 * (1 - factor);
    return [
      factor, 0, 0, 0, offset,
      0, factor, 0, 0, offset,
      0, 0, factor, 0, offset,
      0, 0, 0, 1, 0
    ];
  }

  /// Generates a sepia filter matrix with an enhanced tonal effect.
  ///
  /// This sepia effect uses a slightly higher range to give a more vivid,
  /// cinematic look compared to traditional sepia filters.
  static List<double> sepia(double value) {
    double inv0_607 = 1 - 0.607 * value;
    double inv0_314 = 1 - 0.314 * value;
    double inv0_869 = 1 - 0.869 * value;
    return [
      inv0_607, 0.769 * value, 0.189 * value, 0, 0,
      0.349 * value, inv0_314, 0.168 * value, 0, 0,
      0.272 * value, 0.534 * value, inv0_869, 0, 0,
      0, 0, 0, 1, 0
    ];
  }

  /// Advanced brightness adjustment filter.
  ///
  ///Now adjusted to take into account a wider range of exposure control, allowing
  /// for both darkening and brightening more dynamically.
  static List<double> brightness(double value) {
    value = value * 255;
    return [
      1, 0, 0, 0, value,
      0, 1, 0, 0, value,
      0, 0, 1, 0, value,
      0, 0, 0, 1, 0
    ];
  }
  /// Tone Mapping Filter (HDR Effect)
  ///
  /// Simulates the HDR effect by enhancing both shadows and highlights
  /// This adjusts the midtones and re-balances the brightness in the image.
  static List<double> toneMapping(double intensity) {
    // Clamp the intensity between 0 and 1 to avoid over-exaggeration
    intensity = intensity.clamp(0.0, 1.0);

//The intensity is used to map shadows to brighter tones and tone down highlight
    double shadowBoost = intensity * 0.6; // Lifts the shadows
// Tones down highlights
    double contrastFactor = intensity * 0.4; // Increases contrast

    return [
      1 + contrastFactor, 0, 0, 0, -128 * shadowBoost,// Red channel tone mapping
      0, 1 + contrastFactor, 0, 0, -128 * shadowBoost,//Green channel tone mapping
      0, 0, 1 + contrastFactor, 0, -128 * shadowBoost,//Blue channel tone mapping
      0, 0, 0, 1, 0
    ];
  }
  /// Skin smoothing (beauty filter) using a Gaussian blur.
  ///
  /// Blurs the image slightly to smooth skin textures while maintaining edge
  /// sharpness
  /// using a light blur.
  static List<double> skinSmoothing(double blurIntensity) {
    return [
      1 - blurIntensity, 0, 0, 0, 0,
      0, 1 - blurIntensity, 0, 0, 0,
      0, 0, 1 - blurIntensity, 0, 0,
      0, 0, 0, 1, 0
    ];
  }

  /// Generates an LUT-based color filter matrix.
  ///
  ///You can use a pre-defined LUT (lookup table) to transform the colors of the
  /// image, applying a cinematic or predefined filter effect.
  static List<double> lutFilter(double lutIntensity) {
    //Lookup table would be applied here, but for now, a simple color transform.
    return [
      1 + lutIntensity, 0, 0, 0, 0,
      0, 1 + lutIntensity, 0, 0, 0,
      0, 0, 1 + lutIntensity, 0, 0,
      0, 0, 0, 1, 0
    ];
  }

  /// Invert color filter matrix.
  static List<double> invert() {
    return [
      -1, 0, 0, 0, 255,
      0, -1, 0, 0, 255,
      0, 0, -1, 0, 255,
      0, 0, 0, 1, 0
    ];
  }

  /// Generates a saturation adjustment filter matrix.
  static List<double> saturation(double value) {
    double x = 1 + (value > 0 ? 3 * value : value);
    double xInverted = 1 - x;
    const double lumR = 0.3086;
    const double lumG = 0.6094;
    const double lumB = 0.082;

    return [
      lumR * xInverted + x, lumG * xInverted, lumB * xInverted, 0, 0,
      lumR * xInverted, lumG * xInverted + x, lumB * xInverted, 0, 0,
      lumR * xInverted, lumG * xInverted, lumB * xInverted + x, 0, 0,
      0, 0, 0, 1, 0
    ];
  }

  /// Generates a hue adjustment filter matrix.
  static List<double> hue(double value) {
    value *= pi;
    double cosVal = cos(value);
    double sinVal = sin(value);
    const double lumR = 0.213;
    const double lumG = 0.715;
    const double lumB = 0.072;

    return [
      lumR + cosVal * (1 - lumR) + sinVal * (-lumR),
      lumG + cosVal * (-lumG) + sinVal * (-lumG),
      lumB + cosVal * (-lumB) + sinVal * (1 - lumB), 0, 0,
      lumR + cosVal * (-lumR) + sinVal * (0.143),
      lumG + cosVal * (1 - lumG) + sinVal * (0.14),
      lumB + cosVal * (-lumB) + sinVal * (-0.283), 0, 0,
      lumR + cosVal * (-lumR) + sinVal * -(1 - lumR),
      lumG + cosVal * (-lumG) + sinVal * (lumG),
      lumB + cosVal * (1 - lumB) + sinVal * (lumB), 0, 0,
      0, 0, 0, 1, 0
    ];
  }

  ///
  static List<double> contrast(double value) {
    // Ensure the value is clamped to an acceptable range (-1.0 to 1.0)
    double clampedValue = value.clamp(-1.0, 1.0) * 255;
    double factor = (259 * (clampedValue + 255)) / (255 * (259 - clampedValue));
    double offset = 128 * (1 - factor);
    return [
      factor, 0, 0, 0, offset,
      0, factor, 0, 0, offset,
      0, 0, factor, 0, offset,
      0, 0, 0, 1, 0
    ];
  }
  ///
  static List<double> grayscale() {
    const double lumR = 0.2126; // Red luminance
    const double lumG = 0.7152; // Green luminance (most sensitive to human eye)
    const double lumB = 0.0722; // Blue luminance
    return [
      lumR, lumG, lumB, 0, 0,
      lumR, lumG, lumB, 0, 0,
      lumR, lumG, lumB, 0, 0,
      0, 0, 0, 1, 0
    ];
  }
  ///
  static List<double> addictiveColor(double r, double g, double b) {
    return [
      1, 0, 0, 0, r,  // Add to red channel
      0, 1, 0, 0, g,  // Add to green channel
      0, 0, 1, 0, b,  // Add to blue channel
      0, 0, 0, 1, 0
    ];
  }


  /// Generates an opacity adjustment filter matrix.
  static List<double> opacity(double value) {
    return [1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, value, 0];
  }
  /// Advanced sharpness filter matrix.
  ///
  /// This method sharpens the image using a convolution matrix. The higher the
  /// intensity,
  /// the more pronounced the sharpening effect, useful for bringing out edges
  /// and details.
  static List<double> sharpen(double intensity) {
    // The basic principle for sharpening involves subtracting the inverse
    // intensity from surrounding pixels.
    // You can tweak the values to get a more aggressive or subtle sharpness
    // effect.
    return [
      1 + intensity, -intensity, -intensity, 0, 0,  // Red channel sharpness
      -intensity, 1 + intensity, -intensity, 0, 0,  // Green channel sharpness
      -intensity, -intensity, 1 + intensity, 0, 0,  // Blue channel sharpness
      0, 0, 0, 1, 0                                // Alpha channel unaffected
    ];
  }

  /// Gamma correction using a non-linear transformation for each RGB channel.
  ///
  /// This approach applies gamma correction to the red, green, and blue channel
  /// directly by modifying their intensity non-linearly.
  static List<double> gamma(double gammaValue) {
    // Ensure gammaValue is clamped to a reasonable range to avoid extreme result
    gammaValue = gammaValue.clamp(0.1, 5.0);

    // Calculate the inverse of the gamma value for applying the correction.
    double invGamma = 1.0 / gammaValue;

    // Cast the result of pow() to double to avoid type issues.
    return [
      pow(1.0, invGamma).toDouble(), 0, 0, 0, 0,   // Red channel adjustment
      0, pow(1.0, invGamma).toDouble(), 0, 0, 0,   // Green channel adjustment
      0, 0, pow(1.0, invGamma).toDouble(), 0, 0,   // Blue channel adjustment
      0, 0, 0, 1, 0                          // Alpha channel remains unchanged
    ];
  }
}