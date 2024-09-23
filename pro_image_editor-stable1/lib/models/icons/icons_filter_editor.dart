// Flutter imports:
import 'package:flutter/material.dart';

// FontAwesome import:
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// Customizable icons for the Filter Editor component.
class IconsFilterEditor {
  /// Creates an instance of [IconsFilterEditor] with customizable icon
  /// settings.
  ///
  /// You can provide a custom icon for the bottom navigation bar in the Filter
  /// Editor component.
  ///
  /// If no custom icon is provided, a default filter icon is used.
  ///
  /// Example:
  ///
  /// ```dart
  /// IconsFilterEditor(
  ///   bottomNavBar: FontAwesomeIcons.filter,
  /// )
  /// ```
  const IconsFilterEditor({
    this.bottomNavBar = FontAwesomeIcons.filter,
  });

  /// The icon to be displayed in the bottom navigation bar.
  final IconData bottomNavBar;
}
