// Flutter imports:
import 'package:flutter/material.dart';

// FontAwesome import:
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// Customizable icons for the Painting Editor component.
class IconsPaintingEditor {
  /// Creates an instance of [IconsPaintingEditor] with customizable icon
  /// settings.
  ///
  /// You can provide custom icons for various actions in the Painting Editor
  /// component.
  ///
  /// - [bottomNavBar]: The icon for the bottom navigation bar.
  /// - [lineWeight]: The icon for adjusting line weight.
  /// - [fill]: The icon for filling the background.
  /// - [noFill]: The icon for not filling the background.
  /// - [freeStyle]: The icon for the freehand drawing tool.
  /// - [arrow]: The icon for the arrow drawing tool.
  /// - [line]: The icon for the straight line drawing tool.
  /// - [rectangle]: The icon for the rectangle drawing tool.
  /// - [circle]: The icon for the circle drawing tool.
  /// - [dashLine]: The icon for the dashed line drawing tool.
  ///
  /// If no custom icons are provided, default icons are used for each action.
  ///
  /// Example:
  ///
  /// ```dart
  /// IconsPaintingEditor(
  ///   bottomNavBar: FontAwesomeIcons.paintBrush,
  ///   lineWeight: FontAwesomeIcons.weight,
  ///   fill: FontAwesomeIcons.fill,
  ///   noFill: FontAwesomeIcons.timesCircle,
  ///   freeStyle: FontAwesomeIcons.penFancy,
  ///   arrow: FontAwesomeIcons.longArrowAltRight,
  ///   line: FontAwesomeIcons.minus,
  ///   rectangle: FontAwesomeIcons.square,
  ///   circle: FontAwesomeIcons.circle,
  ///   dashLine: FontAwesomeIcons.ellipsisH,
  /// )
  /// ```
  const IconsPaintingEditor({
    this.moveAndZoom = FontAwesomeIcons.maximize,
    this.changeOpacity = FontAwesomeIcons.droplet,
    this.eraser = FontAwesomeIcons.eraser,
    this.bottomNavBar = FontAwesomeIcons.paintbrush,
    this.lineWeight = FontAwesomeIcons.weightHanging,
    this.freeStyle = FontAwesomeIcons.penFancy,
    this.arrow = FontAwesomeIcons.arrowRight,
    this.line = FontAwesomeIcons.minus,
    this.fill = FontAwesomeIcons.fill,
    this.noFill = FontAwesomeIcons.circleXmark,
    this.rectangle = FontAwesomeIcons.square,
    this.circle = FontAwesomeIcons.circle,
    this.dashLine = FontAwesomeIcons.ellipsis,
  });

  /// The icon to be displayed in the bottom navigation bar.
  final IconData bottomNavBar;

  /// The icon for adjusting line weight.
  final IconData lineWeight;

  /// The icon used for moving and zooming within the editor.
  final IconData moveAndZoom;

  /// The icon representing a filled background.
  final IconData fill;

  /// The icon representing to change the opacity.
  final IconData changeOpacity;

  /// The icon representing an unfilled (transparent) background.
  final IconData noFill;

  /// The icon for the freehand drawing tool.
  final IconData freeStyle;

  /// The icon for the arrow drawing tool.
  final IconData arrow;

  /// The icon for the straight line drawing tool.
  final IconData line;

  /// The icon for the rectangle drawing tool.
  final IconData rectangle;

  /// The icon for the circle drawing tool.
  final IconData circle;

  /// The icon for the dashed line drawing tool.
  final IconData dashLine;

  /// The icon for the eraser tool.
  final IconData eraser;
}
