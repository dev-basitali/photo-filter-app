import 'dart:math';

import 'package:flutter/material.dart';

/// A StatefulWidget that provides a text editing interface for adding and editing text layers.
class CopyUrlEditor extends StatefulWidget {
  const CopyUrlEditor({super.key});

  @override
  State<CopyUrlEditor> createState() => _CopyUrlEditorState();
}

class _CopyUrlEditorState extends State<CopyUrlEditor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.redAccent,
          height: 200,
          width: 400,
          child: const Text("Copy Url")),
    );
  }
}
