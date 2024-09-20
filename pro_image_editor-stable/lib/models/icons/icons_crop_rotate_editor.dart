// Flutter imports:
import 'package:flutter/material.dart';

// FontAwesome import:
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// Customizable icons for the Crop/Rotate Editor component.
class IconsCropRotateEditor {
  /// Creates an instance of [IconsCropRotateEditor] with customizable icon
  /// settings.
  ///
  /// You can provide custom icons for various actions in the Crop/Rotate Editor component.
  /// - [bottomNavBar] icon represents the icon in the bottom navigation bar.
  /// - [rotate] icon represents the rotate action.
  /// - [aspectRatio] icon represents the aspect ratio action.
  ///
  /// If no custom icons are provided, default icons are used for each action.
  ///
  /// Example:
  ///
  /// ```dart
  /// IconsCropRotateEditor(
  ///   bottomNavBar: FontAwesomeIcons.cropAlt,
  ///   rotate: FontAwesomeIcons.syncAlt,
  ///   aspectRatio: FontAwesomeIcons.expand,
  ///   flip: FontAwesomeIcons.arrowsAltH,
  ///   reset: FontAwesomeIcons.undoAlt,
  /// )
  /// ```
  const IconsCropRotateEditor({
    this.bottomNavBar = FontAwesomeIcons.cropAlt,
    this.rotate = FontAwesomeIcons.syncAlt,
    this.aspectRatio = FontAwesomeIcons.expand,
    this.flip = FontAwesomeIcons.arrowsAltH,
    this.reset = FontAwesomeIcons.undoAlt,
  });

  /// The icon to be displayed in the bottom navigation bar.
  final IconData bottomNavBar;

  /// The icon for the rotate action.
  final IconData rotate;

  /// The icon for the aspect ratio action.
  final IconData aspectRatio;

  /// The icon for the flip action.
  final IconData flip;

  /// The icon for the reset action.
  final IconData reset;
}
