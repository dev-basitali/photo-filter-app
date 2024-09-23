import 'package:flutter/material.dart';

/// A StatefulWidget that provides a text editing interface for adding and editing text layers.
class UploadEditor extends StatefulWidget {
  const UploadEditor({super.key});

  @override
  State<UploadEditor> createState() => _UploadEditorState();
}

class _UploadEditorState extends State<UploadEditor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.redAccent,
          height: 200,
          width: 400,
          child: const Text("Upload")),
    );
  }
}
