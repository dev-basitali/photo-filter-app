// Flutter imports:
import 'package:flutter/material.dart';

// FontAwesome import:
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// Customizable icons for the Blur Editor component.
class IconsBlurEditor {
  /// Creates an instance of [IconsBlurEditor] with customizable icon settings.
  ///
  /// You can provide a custom icon for the bottom navigation bar in the Blur
  /// Editor component.
  ///
  /// If no custom icon is provided, a default blur icon is used.
  ///
  /// Example:
  ///
  /// ```dart
  /// IconsBlurEditor(
  ///   bottomNavBar: FontAwesomeIcons.eyeDropper,
  /// )
  /// ```
  const IconsBlurEditor({
    this.bottomNavBar = FontAwesomeIcons.eyeDropper,
  });

  /// The icon to be displayed in the bottom navigation bar.
  final IconData bottomNavBar;
}