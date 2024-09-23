// Mocks generated by Mockito 5.4.4 from annotations
// in pro_image_editor/test/widgets/color_picker/bar_color_picker_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes, must_be_immutable

// Dart imports:
import 'dart:ui' as _i2;

// Flutter imports:
import 'package:flutter/foundation.dart' as _i5;
import 'package:flutter/material.dart' as _i4;

// Package imports:
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i8;

// Project imports:
import 'package:pro_image_editor/pro_image_editor.dart' as _i3;

import 'package:pro_image_editor/widgets/color_picker/bar_color_picker.dart'
    as _i6;
import 'package:pro_image_editor/widgets/color_picker/color_picker_configs.dart'
    as _i7;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeColor_0 extends _i1.SmartFake implements _i2.Color {
  _FakeColor_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeProImageEditorConfigs_1 extends _i1.SmartFake
    implements _i3.ProImageEditorConfigs {
  _FakeProImageEditorConfigs_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeState_2<T extends _i4.StatefulWidget> extends _i1.SmartFake
    implements _i4.State<T> {
  _FakeState_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );

  @override
  String toString({_i4.DiagnosticLevel? minLevel = _i4.DiagnosticLevel.info}) =>
      super.toString();
}

class _FakeStatefulElement_3 extends _i1.SmartFake
    implements _i4.StatefulElement {
  _FakeStatefulElement_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );

  @override
  String toString({_i4.DiagnosticLevel? minLevel = _i4.DiagnosticLevel.info}) =>
      super.toString();
}

class _FakeDiagnosticsNode_4 extends _i1.SmartFake
    implements _i4.DiagnosticsNode {
  _FakeDiagnosticsNode_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );

  @override
  String toString({
    _i5.TextTreeConfiguration? parentConfiguration,
    _i4.DiagnosticLevel? minLevel = _i4.DiagnosticLevel.info,
  }) =>
      super.toString();
}

/// A class which mocks [BarColorPicker].
///
/// See the documentation for Mockito's code generation for more information.
class MockBarColorPicker extends _i1.Mock implements _i6.BarColorPicker {
  @override
  _i7.PickMode get pickMode => (super.noSuchMethod(
        Invocation.getter(#pickMode),
        returnValue: _i7.PickMode.color,
        returnValueForMissingStub: _i7.PickMode.color,
      ) as _i7.PickMode);

  @override
  double get length => (super.noSuchMethod(
        Invocation.getter(#length),
        returnValue: 0.0,
        returnValueForMissingStub: 0.0,
      ) as double);

  @override
  dynamic Function(int) get colorListener => (super.noSuchMethod(
        Invocation.getter(#colorListener),
        returnValue: (int value) => null,
        returnValueForMissingStub: (int value) => null,
      ) as dynamic Function(int));

  @override
  double get cornerRadius => (super.noSuchMethod(
        Invocation.getter(#cornerRadius),
        returnValue: 0.0,
        returnValueForMissingStub: 0.0,
      ) as double);

  @override
  bool get horizontal => (super.noSuchMethod(
        Invocation.getter(#horizontal),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  _i2.Color get thumbColor => (super.noSuchMethod(
        Invocation.getter(#thumbColor),
        returnValue: _FakeColor_0(
          this,
          Invocation.getter(#thumbColor),
        ),
        returnValueForMissingStub: _FakeColor_0(
          this,
          Invocation.getter(#thumbColor),
        ),
      ) as _i2.Color);

  @override
  double get thumbRadius => (super.noSuchMethod(
        Invocation.getter(#thumbRadius),
        returnValue: 0.0,
        returnValueForMissingStub: 0.0,
      ) as double);

  @override
  _i2.Color get initialColor => (super.noSuchMethod(
        Invocation.getter(#initialColor),
        returnValue: _FakeColor_0(
          this,
          Invocation.getter(#initialColor),
        ),
        returnValueForMissingStub: _FakeColor_0(
          this,
          Invocation.getter(#initialColor),
        ),
      ) as _i2.Color);

  @override
  _i3.ProImageEditorConfigs get configs => (super.noSuchMethod(
        Invocation.getter(#configs),
        returnValue: _FakeProImageEditorConfigs_1(
          this,
          Invocation.getter(#configs),
        ),
        returnValueForMissingStub: _FakeProImageEditorConfigs_1(
          this,
          Invocation.getter(#configs),
        ),
      ) as _i3.ProImageEditorConfigs);

  @override
  _i4.State<_i4.StatefulWidget> createState() => (super.noSuchMethod(
        Invocation.method(
          #createState,
          [],
        ),
        returnValue: _FakeState_2<_i4.StatefulWidget>(
          this,
          Invocation.method(
            #createState,
            [],
          ),
        ),
        returnValueForMissingStub: _FakeState_2<_i4.StatefulWidget>(
          this,
          Invocation.method(
            #createState,
            [],
          ),
        ),
      ) as _i4.State<_i4.StatefulWidget>);

  @override
  _i4.StatefulElement createElement() => (super.noSuchMethod(
        Invocation.method(
          #createElement,
          [],
        ),
        returnValue: _FakeStatefulElement_3(
          this,
          Invocation.method(
            #createElement,
            [],
          ),
        ),
        returnValueForMissingStub: _FakeStatefulElement_3(
          this,
          Invocation.method(
            #createElement,
            [],
          ),
        ),
      ) as _i4.StatefulElement);

  @override
  String toStringShort() => (super.noSuchMethod(
        Invocation.method(
          #toStringShort,
          [],
        ),
        returnValue: _i8.dummyValue<String>(
          this,
          Invocation.method(
            #toStringShort,
            [],
          ),
        ),
        returnValueForMissingStub: _i8.dummyValue<String>(
          this,
          Invocation.method(
            #toStringShort,
            [],
          ),
        ),
      ) as String);

  @override
  void debugFillProperties(_i5.DiagnosticPropertiesBuilder? properties) =>
      super.noSuchMethod(
        Invocation.method(
          #debugFillProperties,
          [properties],
        ),
        returnValueForMissingStub: null,
      );

  @override
  String toStringShallow({
    String? joiner = r', ',
    _i4.DiagnosticLevel? minLevel = _i4.DiagnosticLevel.debug,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #toStringShallow,
          [],
          {
            #joiner: joiner,
            #minLevel: minLevel,
          },
        ),
        returnValue: _i8.dummyValue<String>(
          this,
          Invocation.method(
            #toStringShallow,
            [],
            {
              #joiner: joiner,
              #minLevel: minLevel,
            },
          ),
        ),
        returnValueForMissingStub: _i8.dummyValue<String>(
          this,
          Invocation.method(
            #toStringShallow,
            [],
            {
              #joiner: joiner,
              #minLevel: minLevel,
            },
          ),
        ),
      ) as String);

  @override
  String toStringDeep({
    String? prefixLineOne = r'',
    String? prefixOtherLines,
    _i4.DiagnosticLevel? minLevel = _i4.DiagnosticLevel.debug,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #toStringDeep,
          [],
          {
            #prefixLineOne: prefixLineOne,
            #prefixOtherLines: prefixOtherLines,
            #minLevel: minLevel,
          },
        ),
        returnValue: _i8.dummyValue<String>(
          this,
          Invocation.method(
            #toStringDeep,
            [],
            {
              #prefixLineOne: prefixLineOne,
              #prefixOtherLines: prefixOtherLines,
              #minLevel: minLevel,
            },
          ),
        ),
        returnValueForMissingStub: _i8.dummyValue<String>(
          this,
          Invocation.method(
            #toStringDeep,
            [],
            {
              #prefixLineOne: prefixLineOne,
              #prefixOtherLines: prefixOtherLines,
              #minLevel: minLevel,
            },
          ),
        ),
      ) as String);

  @override
  _i4.DiagnosticsNode toDiagnosticsNode({
    String? name,
    _i5.DiagnosticsTreeStyle? style,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #toDiagnosticsNode,
          [],
          {
            #name: name,
            #style: style,
          },
        ),
        returnValue: _FakeDiagnosticsNode_4(
          this,
          Invocation.method(
            #toDiagnosticsNode,
            [],
            {
              #name: name,
              #style: style,
            },
          ),
        ),
        returnValueForMissingStub: _FakeDiagnosticsNode_4(
          this,
          Invocation.method(
            #toDiagnosticsNode,
            [],
            {
              #name: name,
              #style: style,
            },
          ),
        ),
      ) as _i4.DiagnosticsNode);

  @override
  List<_i4.DiagnosticsNode> debugDescribeChildren() => (super.noSuchMethod(
        Invocation.method(
          #debugDescribeChildren,
          [],
        ),
        returnValue: <_i4.DiagnosticsNode>[],
        returnValueForMissingStub: <_i4.DiagnosticsNode>[],
      ) as List<_i4.DiagnosticsNode>);

  @override
  String toString({_i4.DiagnosticLevel? minLevel = _i4.DiagnosticLevel.info}) =>
      super.toString();
}
