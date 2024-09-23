import 'filter_addons.dart';
import 'filter_model.dart';

/// Enhanced preset filters for a more attractive and modern style
class PresetFilters {
  /// NoFilter: No filter
  static FilterModel none = const FilterModel(
    name: 'No Filter',
    filters: [],
  );

  /// Clarendon: Bright and vibrant, strong highlights, and cool tones
  static FilterModel clarendon = FilterModel(
    name: 'Clarendon',
    filters: [
      ColorFilterAddons.brightness(0.1), // Subtle brightness
      ColorFilterAddons.contrast(0.1), // Mild contrast
      ColorFilterAddons.saturation(
          0.15), // Less vivid colors for a natural look
      ColorFilterAddons.rgbScale(
          1.02, 1.01, 1.05), // Very slight cool blue tint
    ],
  );

  /// Gingham: Soft, vintage with muted colors, more balanced
  static FilterModel gingham = FilterModel(
    name: 'Gingham',
    filters: [
      ColorFilterAddons.sepia(0.08), // Lighter sepia for a soft vintage look
      ColorFilterAddons.contrast(0.05), // Gentle contrast for a smooth effect
      ColorFilterAddons.brightness(-0.1), // Light brightness for a faded look
      ColorFilterAddons.saturation(0.1), // Slightly muted saturation
    ],
  );

  /// Juno: Warmer tones with balanced saturation
  static FilterModel juno = FilterModel(
    name: 'Juno',
    filters: [
      ColorFilterAddons.rgbScale(1.05, 1.03, 0.98), // Gentle warm tones
      ColorFilterAddons.saturation(0.2), // Natural and balanced colors
      ColorFilterAddons.brightness(0.1), // Slight brightness
      ColorFilterAddons.contrast(0.15), // Moderate contrast
    ],
  );

  /// Lark: Bright, desaturated, with a cooler tone
  static FilterModel lark = FilterModel(
    name: 'Lark',
    filters: [
      ColorFilterAddons.brightness(0.1), // Softer highlights

      ColorFilterAddons.saturation(0.25), // Reduced saturation for balance
      ColorFilterAddons.contrast(-0.1), // Mild contrast for clarity
    ],
  );

  /// Ludwig: Clean and soft with gentle warm tones
  static FilterModel ludwig = FilterModel(
    name: 'Ludwig',
    filters: [
      ColorFilterAddons.brightness(-0.1), // Subtle brightness
      ColorFilterAddons.saturation(0.3), // Very slight increase in saturation
      ColorFilterAddons.hue(-0.05),
      ColorFilterAddons.contrast(-0.3), // Soft contrast
    ],
  );

  /// Perpetua: Soft cool tones with a natural brightness
  static FilterModel perpetua = FilterModel(
    name: 'Perpetua',
    filters: [
      ColorFilterAddons.brightness(0.1), // Subtle brightness
      ColorFilterAddons.contrast(-0.1), // Gentle contrast
      ColorFilterAddons.saturation(0.51), // Soft saturation boost
    ],
  );

  ///
  static FilterModel blackandwhite = FilterModel(
    name: 'B&W',
    filters: [
      ColorFilterAddons.grayscale(),
      ColorFilterAddons.skinSmoothing(
          0.1), //Very slight smooth for natural look
      ColorFilterAddons.brightness(0.05), // Minimal brightness for a fresh glow
      ColorFilterAddons.saturation(0.15), // Slight color enhancement
      ColorFilterAddons.contrast(
          0.05), //Minimal contrast boost for softer tones
    ],
  );

  /// Hudson: Softer contrast with cool blue tones
  static FilterModel hudson = FilterModel(
    name: 'Hudson',
    filters: [
      ColorFilterAddons.rgbScale(0.95, 0.95, 1.1), // Softer cool tones
      ColorFilterAddons.contrast(0.15), // Moderate contrast
      ColorFilterAddons.brightness(0.1), // Slight brightness
      ColorFilterAddons.vignette(0.15), // Soft vignette for balance
      ColorFilterAddons.skinSmoothing(0.1),//Soft skin smoothing for balance for
      ColorFilterAddons.saturation(0.17),
    ],
  );

  /// Valencia: Soft and warm with a gentle vintage glow
  static FilterModel valencia = FilterModel(
    name: 'Valencia',
    filters: [
      ColorFilterAddons.colorOverlay(255, 220, 180, 0.1), // Soft warm overlay
      ColorFilterAddons.brightness(0.1), // Subtle brightness
      ColorFilterAddons.saturation(0.1), // Gentle saturation boost
      ColorFilterAddons.contrast(0.1), // Mild contrast
    ],
  );

  /// X-Pro II: Bold but balanced colors with natural contrast
  static FilterModel xProII = FilterModel(
    name: 'X-Pro II',
    filters: [
      // ColorFilterAddons.rgbScale(1.1, 1.02, 0.95),// Balanced warm colors
      ColorFilterAddons.saturation(0.1), // Softer saturation
      ColorFilterAddons.contrast(-0.2), // Moderate contrast
      ColorFilterAddons.vignette(0.3), // Softer vignette for balance
      ColorFilterAddons.brightness(0.1), // Softer vignette for balance
    ],
  );

  /// Rise: Warm with a gentle glow and balanced tones
  static FilterModel rise = FilterModel(
    name: 'Rise',
    filters: [
      ColorFilterAddons.colorOverlay(255, 200, 150, 0.15), // Soft warm glow
      ColorFilterAddons.brightness(-0.1), // Balanced brightness
      ColorFilterAddons.saturation(0.15), // Softer rich colors
      ColorFilterAddons.vignette(0.15), // Light vignette
    ],
  );

  /// Reyes: Faded and warm with softer undertones
  static FilterModel reyes = FilterModel(
    name: 'Reyes',
    filters: [
      ColorFilterAddons.sepia(0.1), // Subtle sepia for warmth
      ColorFilterAddons.brightness(0.1), // Gentle brightness
      ColorFilterAddons.saturation(-0.1), // Softer faded saturation
      ColorFilterAddons.contrast(-0.05), // Very soft contrast
    ],
  );

  /// Toaster: Aged with warm tones, softened for natural look
  static FilterModel toaster = FilterModel(
    name: 'Toaster',
    filters: [
      ColorFilterAddons.colorOverlay(248, 184, 104, 0.2), // Soft warm tones
      ColorFilterAddons.brightness(0.1), // Balanced brightness
      ColorFilterAddons.vignette(-0.2), // Softer vignette
    ],
  );

  /// Nashville: Bright and warm with subtle pink undertones
  static FilterModel nashville = FilterModel(
    name: 'Nashville',
    filters: [
      ColorFilterAddons.colorOverlay(250, 200, 230, 0.1), // Subtle pink overlay
      ColorFilterAddons.brightness(0.1), // Slight brightness
      ColorFilterAddons.contrast(-0.05), // Soft contrast
    ],
  );

  /// Sutro: Dark with moody tones, softened for balance
  static FilterModel sutro = FilterModel(
    name: 'Sutro',
    filters: [
      ColorFilterAddons.brightness(-0.1), // Gentle darkening
      ColorFilterAddons.saturation(-0.1), // Soft muted colors
      ColorFilterAddons.colorOverlay(102, 34, 153, 0.1), // Softer purple tone
      ColorFilterAddons.vignette(0.3), // Softer vignette
    ],
  );

  /// Addictive Blue: Intense blue overlay
  static FilterModel addictiveBlue = FilterModel(
    name: 'AddictiveBlue',
    filters: [
      // More intense blue
      ColorFilterAddons.brightness(0.15), // Added brightness
      ColorFilterAddons.contrast(0.2), // Slight contrast boost
    ],
  );

  /// Amaro: Bright and slightly faded
  static FilterModel amaro = FilterModel(
    name: 'Amaro',
    filters: [
      ColorFilterAddons.saturation(0.2), // Soft saturation for a natural look
      ColorFilterAddons.brightness(0.15), // Balanced brightness
      ColorFilterAddons.contrast(0.1), // Soft contrast
      ColorFilterAddons.vignette(0.1), // Soft vignette
      ColorFilterAddons.colorOverlay(255, 255, 255, 0.2), // Soft white overlay
      ColorFilterAddons.dynamicContrast(0.1)
    ],
  );

  ///Beauty Filter: Softens skin, enhances brightness, and boosts color slightly
  static FilterModel beauty = FilterModel(
    name: 'Beauty',
    filters: [
      ColorFilterAddons.skinSmoothing(
          0.2), //Light Gaussian blur for skin smooth
      ColorFilterAddons.brightness(0.1), // Slight brightness to add glow
      ColorFilterAddons.contrast(-0.05), // Balanced contrast for natural depth
      ColorFilterAddons.saturation(
          0.15), //Soft saturation boost for vibrant color
      ColorFilterAddons.hue(-0.05)
    ],
  );

  ///Natural Filter:Natural beauty effect with color enhancement and no warm
  ///tones
  static FilterModel natural = FilterModel(
    name: 'Natural',
    filters: [
      ColorFilterAddons.skinSmoothing(
          0.1), //Very slight smooth for natural look
      ColorFilterAddons.brightness(0.05), // Minimal brightness for a fresh glow
      ColorFilterAddons.saturation(0.15), // Slight color enhancement
      ColorFilterAddons.contrast(
          0.05), //Minimal contrast boost for softer tones
    ],
  );


  /// Whitening Filter 1: Soft, pale skin effect with reduced saturation and
  /// increased brightness
  static FilterModel whiteningSoft = FilterModel(
    name: 'Whitening Soft',
    filters: [
      ColorFilterAddons.brightness(0.1), // Increased brightness for a pale look
      ColorFilterAddons.saturation(0.2), // Reduce saturation for a fairer skin
      ColorFilterAddons.contrast(0.1), // Balanced contrast for soft tones
      ColorFilterAddons.skinSmoothing(0.2), // Slight smoothing for natural skin
      ColorFilterAddons.colorOverlay(255, 255, 255, 0.2), // Soft white overlay
    ],
  );

  /// Whitening Filter 2: Strong whitening effect with high brightness and low
  /// saturation
  static FilterModel whiteningStrong = FilterModel(
    name: 'Whitening Strong',
    filters: [
      ColorFilterAddons.brightness(0.25), //High brightness for strong whitening
      ColorFilterAddons.saturation(0.3), // Decrease saturation significantly
      ColorFilterAddons.contrast(0.15), // Slight contrast increase for clarity
      ColorFilterAddons.skinSmoothing(0.3), // More aggressive skin smoothing
    ],
  );

  /// Warm Glow Filter: Adds a soft warm tint with minimal color shifts
  static FilterModel warmGlow = FilterModel(
    name: 'Warm Glow',
    filters: [
      ColorFilterAddons.colorOverlay(
          255, 220, 180, 0.1), //Soft warm ton overlay
      ColorFilterAddons.brightness(0.15), // Slight brightness boost
      ColorFilterAddons.saturation(0.15), // Subtle saturation
      ColorFilterAddons.contrast(0.15), // Subtle saturation
    ],
  );

  /// HDR: Enhances shadows and highlights for a balanced and vibrant image
  static FilterModel hdr = FilterModel(
    name: 'HDR',
    filters: [
      ColorFilterAddons.brightness(0.2), // Slightly brighter highlights
      ColorFilterAddons.contrast(0.27), // Enhanced contrast for more depth
      ColorFilterAddons.toneMapping(1), // Dynamic tone mapping for HDR effect
      ColorFilterAddons.saturation(
          0.17), //Mild saturation boost to enhance color
      ColorFilterAddons.skinSmoothing(0.4),
      ColorFilterAddons.colorOverlay(255, 255, 255, 0.2), // Soft white overlay
      ColorFilterAddons.vignette(0.1),
    ],
  );
}

/// List of enhanced filter presets
List<FilterModel> presetFiltersList = [
  PresetFilters.none,
  PresetFilters.gingham,
  PresetFilters.beauty,
  PresetFilters.natural,
  PresetFilters.hdr,
  PresetFilters.warmGlow,
  PresetFilters.whiteningSoft,
  PresetFilters.whiteningStrong,
  PresetFilters.lark,
  PresetFilters.ludwig,
  PresetFilters.blackandwhite,
  PresetFilters.perpetua,
  PresetFilters.hudson,
  PresetFilters.valencia,
  PresetFilters.xProII,
  PresetFilters.rise,
  PresetFilters.reyes,
  PresetFilters.toaster,
  PresetFilters.nashville,
  PresetFilters.sutro,
  PresetFilters.addictiveBlue,
  PresetFilters.amaro,
  PresetFilters.juno,
];