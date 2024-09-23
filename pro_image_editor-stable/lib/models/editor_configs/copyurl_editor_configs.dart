import 'dart:typed_data';

import 'package:flutter/widgets.dart';

import '../../widgets/layer_widget.dart';

/// Configuration options for a Upload editor.
///
/// `TextEditorConfigs` allows you to define settings for a text editor,
/// including whether the editor is enabled, which text formatting options
/// are available, and the initial font size.
///
/// Example usage:
/// ```dart
/// TextEditorConfigs(
///   enabled: true,
///   canToggleTextAlign: true,
///   canToggleBackgroundMode: true,
///   initFontSize: 24.0,
/// );
/// ```
class CopyUrlEditorConfigs {
  /// Indicates whether the text editor is enabled.
  final bool enabled;

  /// Indicates whether the imagePath is define
  final String? urlPath;

  /// Creates an instance of TextEditorConfigs with optional settings.
  ///
  /// By default, the text editor is enabled, and most text formatting options
  /// are enabled. The initial font size is set to 24.0.
  const CopyUrlEditorConfigs({
    this.enabled = true,
    this.urlPath,
  });
}
