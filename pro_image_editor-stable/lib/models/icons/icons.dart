// Flutter imports:
import 'package:flutter/material.dart';

// FontAwesome imports:
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Project imports:
import 'icons_blur_editor.dart';
import 'icons_crop_rotate_editor.dart';
import 'icons_emoji_editor.dart';
import 'icons_filter_editor.dart';
import 'icons_layer_interaction.dart';
import 'icons_painting_editor.dart';
import 'icons_sticker_editor.dart';
import 'icons_text_editor.dart';

export 'icons_blur_editor.dart';
export 'icons_crop_rotate_editor.dart';
export 'icons_emoji_editor.dart';
export 'icons_filter_editor.dart';
export 'icons_layer_interaction.dart';
export 'icons_painting_editor.dart';
export 'icons_sticker_editor.dart';
export 'icons_text_editor.dart';

/// Customizable icons for the Image Editor component.
class ImageEditorIcons {
  ///
  const ImageEditorIcons({
    this.paintingEditor = const IconsPaintingEditor(),
    this.textEditor = const IconsTextEditor(),
    this.cropRotateEditor = const IconsCropRotateEditor(),
    this.filterEditor = const IconsFilterEditor(),
    this.blurEditor = const IconsBlurEditor(),
    this.emojiEditor = const IconsEmojiEditor(),
    this.stickerEditor = const IconsStickerEditor(),
    this.layerInteraction = const IconsLayerInteraction(),
    this.closeEditor = FontAwesomeIcons.times, // Close Icon
    this.doneIcon = FontAwesomeIcons.check, // Done Icon
    this.applyChanges = FontAwesomeIcons.check, // Apply Changes Icon
    this.backButton = FontAwesomeIcons.arrowLeft, // Back Button Icon
    this.undoAction = FontAwesomeIcons.undo, // Undo Action Icon
    this.redoAction = FontAwesomeIcons.redo, // Redo Action Icon
    this.removeElementZone = FontAwesomeIcons.trashAlt, // Remove Element Icon
  });
///
  final IconData closeEditor;
  ///
  final IconData doneIcon;
  ///
  final IconData backButton;
  ///
  final IconData applyChanges;
  ///
  final IconData undoAction;
  ///
  final IconData redoAction;
  ///
  final IconData removeElementZone;

  ///
  final IconsPaintingEditor paintingEditor;
  ///
  final IconsTextEditor textEditor;
  ///
  final IconsCropRotateEditor cropRotateEditor;
  ///
  final IconsFilterEditor filterEditor;
  ///
  final IconsBlurEditor blurEditor;
  ///
  final IconsEmojiEditor emojiEditor;
  ///
  final IconsStickerEditor stickerEditor;
  ///
  final IconsLayerInteraction layerInteraction;
}
