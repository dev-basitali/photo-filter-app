// Flutter imports:
import 'package:flutter/material.dart';

// FontAwesome import:
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// Customizable icons for the Text Editor component.
class IconsTextEditor {
  /// Creates an instance of [IconsTextEditor] with customizable icon settings.
  ///
  /// You can provide custom icons for various actions in the Text Editor
  /// component.
  ///
  /// - [bottomNavBar]: The icon for the bottom navigation bar.
  /// - [alignLeft]: The icon for aligning text to the left.
  /// - [alignCenter]: The icon for aligning text to the center.
  /// - [alignRight]: The icon for aligning text to the right.
  /// - [backgroundMode]: The icon for toggling background mode.
  ///
  /// If no custom icons are provided, default icons are used for each action.
  ///
  /// Example:
  ///
  /// ```dart
  /// IconsTextEditor(
  ///   bottomNavBar: FontAwesomeIcons.textHeight,
  ///   alignLeft: FontAwesomeIcons.alignLeft,
  ///   alignCenter: FontAwesomeIcons.alignCenter,
  ///   alignRight: FontAwesomeIcons.alignRight,
  ///   backgroundMode: FontAwesomeIcons.layerGroup,
  /// )
  /// ```
  const IconsTextEditor({
    this.bottomNavBar = FontAwesomeIcons.textHeight,
    this.alignLeft = FontAwesomeIcons.alignLeft,
    this.alignCenter = FontAwesomeIcons.alignCenter,
    this.alignRight = FontAwesomeIcons.alignRight,
    this.fontScale = FontAwesomeIcons.textWidth,
    this.resetFontScale = FontAwesomeIcons.undoAlt,
    this.backgroundMode = FontAwesomeIcons.layerGroup,
  });

  /// The icon to be displayed in the bottom navigation bar.
  final IconData bottomNavBar;

  /// The icon for aligning text to the left.
  final IconData alignLeft;

  /// The icon for aligning text to the center.
  final IconData alignCenter;

  /// The icon for aligning text to the right.
  final IconData alignRight;

  /// The icon for toggling background mode.
  final IconData backgroundMode;

  /// The icon for changing font scale.
  final IconData fontScale;

  /// The icon for resetting font scale to preset value.
  final IconData resetFontScale;
}
