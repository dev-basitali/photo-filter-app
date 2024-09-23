// Flutter imports:
import 'package:flutter/material.dart';

// FontAwesome import:
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// Represents the interaction icons for layers in the theme.
///
/// This class defines the icons used for various layer interactions such as
/// removing a layer and rotating/scaling a layer.
class IconsLayerInteraction {
  /// Creates a new instance of [IconsLayerInteraction].
  ///
  /// The [edit] icon defaults to [FontAwesomeIcons.penToSquare].
  /// The [remove] icon defaults to [FontAwesomeIcons.xmark].
  /// The [rotateScale] icon defaults to [FontAwesomeIcons.upDownLeftRight].
  const IconsLayerInteraction({
    this.remove = FontAwesomeIcons.xmark,
    this.edit = FontAwesomeIcons.penToSquare,
    this.rotateScale = FontAwesomeIcons.upDownLeftRight,
  });

  /// The icon data for removing a layer.
  final IconData remove;

  /// The icon data for editing a TextLayer.
  final IconData edit;

  /// The icon data for rotating or scaling a layer.
  final IconData rotateScale;
}
