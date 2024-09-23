import 'package:flutter/material.dart';

/// Customizable icons for the Text Editor component.
class IconsCopyUrlEditor {
  /// The icon to be displayed in the bottom navigation bar.
  final IconData bottomNavBar;

  /// The icon for aligning text to the left.
  /// final IconData alignLeft;

  /// The icon for aligning text to the center.
  /// final IconData alignCenter;

  /// The icon for aligning text to the right.
  /// final IconData alignRight;

  /// The icon for toggling background mode.
  /// final IconData backgroundMode;

  /// The icon for changing font scale.
  /// final IconData fontScale;

  /// The icon for resetting font scale to preset value.
  /// final IconData resetFontScale;

  /// Creates an instance of [IconsCopyUrlEditor] with customizable icon settings.
  ///
  /// You can provide custom icons for various actions in the Text Editor component.
  ///
  /// - [bottomNavBar]: The icon for the bottom navigation bar.

  /// If no custom icons are provided, default icons are used for each action.
  ///
  /// Example:
  ///
  /// ```dart
  /// IconsTextEditor(
  ///   bottomNavBar: Icons.text_fields,
  ///   alignLeft: Icons.align_horizontal_left_rounded,
  ///   alignCenter: Icons.align_horizontal_center_rounded,
  ///   alignRight: Icons.align_horizontal_right_rounded,
  ///   backgroundMode: Icons.layers_rounded,
  /// )
  /// ```
  const IconsCopyUrlEditor({
    this.bottomNavBar = Icons.copy,
  });
}