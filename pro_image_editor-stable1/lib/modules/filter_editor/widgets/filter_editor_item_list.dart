// Dart imports:
import 'dart:math';

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../../../models/crop_rotate_editor/transform_factors.dart';
import '../../../models/editor_configs/pro_image_editor_configs.dart';
import '../../../models/editor_image.dart';
import '../../main_editor/main_editor.dart';
import '../types/filter_matrix.dart';
import '../utils/filter_generator/filter_model.dart';
import '../utils/filter_generator/filter_presets.dart';
import 'filtered_image.dart';

/// A widget for displaying a list of filter editor items, allowing users
/// to select and apply filters to an image.
class FilterEditorItemList extends StatefulWidget {
  /// Constructor for creating an instance of FilterEditorItemList.
   const FilterEditorItemList({
    super.key,
    required this.editorImage,
    this.activeFilters,
    required this.blurFactor,
    this.itemScaleFactor,
    this.transformConfigs,
    this.mainImageSize = Size.zero,
    this.mainBodySize = Size.zero,
    required this.selectedFilter,
    required this.onSelectFilter,
    required this.configs,
    // this.colorFilterMatrix, // Added parameter for color filter matrix
  });

  /// The EditorImage class represents an image with multiple sources,
  /// including bytes, file, network URL, and asset path.
  final EditorImage editorImage;

  /// The image editor configs.
  final ProImageEditorConfigs configs;

  /// Specifies the scale factor for items.
  ///
  /// If provided, this value scales the items in the editor by the specified
  /// factor.
  final double? itemScaleFactor;

  /// Specifies the list of active filter state histories.
  ///
  /// If provided, this list contains the history of active filters applied to
  /// the image.
  final FilterMatrix? activeFilters;

  /// Specifies the blur factor.
  final double blurFactor;

  /// Specifies the selected filter.
  ///
  /// This property represents the currently selected filter for the image
  /// editor.
  final FilterMatrix selectedFilter;

  /// The transform configurations how the image should be initialized.
  final TransformConfigs? transformConfigs;

  /// Callback function for selecting a filter.
  ///
  /// This function is called when a filter is selected in the editor. It takes
  /// a [FilterModel] as a parameter, representing the selected filter.
  final Function(FilterModel filter) onSelectFilter;

  /// The size of the image with layers applied.
  final Size mainImageSize;

  /// The size of the body with layers applied.
  final Size mainBodySize;

  /// The matrix for applying color filters.
  // final List<double> colorFilterMatrix =[]; // Added field for color filter matrix

  @override
  State<FilterEditorItemList> createState() => _FilterEditorItemListState();
}

class _FilterEditorItemListState extends State<FilterEditorItemList> {
  late ScrollController _scrollCtrl;

  /// A list of `ColorFilterGenerator` objects that define the image filters
  /// available in the editor.
  List<FilterModel> get _filters =>
      widget.configs.filterEditorConfigs.filterList ?? presetFiltersList;

  @override
  void initState() {
    _scrollCtrl = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollCtrl.dispose();
    super.dispose();
  }

  final double _brightness = -0.60;
  final double _contrast = -0.60;
  final double _temperature = 0.0;
  final List<double> _combinedMatrix = List.filled(20, 0);

  @override
  Widget build(BuildContext context) {
    List<double> brightnessMatrix = ImageAdjustment.brightness(_brightness);
    List<double> contrastMatrix = ImageAdjustment.contrast(_contrast);
    List<double> temperatureMatrix = ImageAdjustment.temperature(_temperature);

    List<double> combinedMatrix = List.generate(20, (index) => 0);

    for (int i = 0; i < 4; i++) {
      for (int j = 0; j < 5; j++) {
        combinedMatrix[i * 5 + j] = brightnessMatrix[i * 5 + j] +
            contrastMatrix[i * 5 + j] +
            temperatureMatrix[i * 5 + j];
      }
    }

    return _buildFilterList();
  }

  /// Builds a horizontal list of filter preview buttons.
  Widget _buildFilterList() {
    return SizedBox(
      height: 104,
      child: Scrollbar(
        controller: _scrollCtrl,
        scrollbarOrientation: ScrollbarOrientation.bottom,
        thumbVisibility: isDesktop,
        trackVisibility: isDesktop,
        child: SingleChildScrollView(
          controller: _scrollCtrl,
          scrollDirection: Axis.horizontal,
          child: ConstrainedBox(
            constraints:
            BoxConstraints(minWidth: MediaQuery.of(context).size.width),
            child: Padding(
              padding:
              widget.configs.imageEditorTheme.filterEditor.filterListMargin,
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.end,
                alignment: WrapAlignment.spaceAround,
                spacing: widget
                    .configs.imageEditorTheme.filterEditor.filterListSpacing,
                children: <Widget>[
                  for (int i = 0; i < _filters.length; i++)
                    buildFilterButton(
                      filter: _filters[i],
                      index: i,
                      activeFilters: widget.activeFilters,
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Create a button for filter preview.
  Widget buildFilterButton({
    required FilterModel filter,
    required int index,
    FilterMatrix? activeFilters,
  }) {
    bool isSelected =
        widget.selectedFilter.hashCode == filter.filters.hashCode ||
            (widget.selectedFilter.isEmpty && filter.filters.isEmpty);

    if (widget.configs.customWidgets.filterEditor.filterButton != null) {
      return widget.configs.customWidgets.filterEditor.filterButton!.call(
        FilterModel(
          name: widget.configs.i18n.filterEditor.filters
              .getFilterI18n(filter.name),
          filters: filter.filters,
        ),
        isSelected,
        widget.itemScaleFactor,
            () => setState(() => widget.onSelectFilter(filter)),
        _buildPreviewImage(
          const Size(64, 64),
          filter,
        ),
        ValueKey('Filter-${filter.name}-$index'),
      );
    }

    return GestureDetector(
      key: ValueKey('Filter-${filter.name}-$index'),
      onTap: () {
        widget.onSelectFilter(filter);
      },
      child: Column(
        children: [
          _buildPreviewImage(
            const Size(64, 64),
            filter,
            margin: const EdgeInsets.only(bottom: 4),
            borderRadius: BorderRadius.circular(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color: const Color(0xFF242424),
                width: 1,
              ),
            ),
          ),
          Text(
            widget.configs.i18n.filterEditor.filters.getFilterI18n(filter.name),
            style: TextStyle(
              fontSize: 11,
              color: isSelected
                  ? widget.configs.imageEditorTheme.filterEditor
                  .previewSelectedTextColor
                  : widget
                  .configs.imageEditorTheme.filterEditor.previewTextColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPreviewImage(
      Size size,
      FilterModel filter, {
        EdgeInsets? margin,
        Decoration? decoration,
        BorderRadius borderRadius = BorderRadius.zero,
      }) {
    TransformConfigs transformConfigs =
        widget.transformConfigs ?? TransformConfigs.empty();

    bool emptyConfigs = transformConfigs.isEmpty;

    Size imageSize = emptyConfigs || transformConfigs.cropRect == Rect.largest
        ? widget.mainImageSize
        : transformConfigs.cropRect.size;

    double offsetFactor =
    emptyConfigs ? 1 : widget.mainImageSize.longestSide / size.shortestSide;
    double fitCoverScale = emptyConfigs
        ? 1
        : max(
      max(widget.mainImageSize.aspectRatio,
          1 / widget.mainImageSize.aspectRatio),
      max(imageSize.aspectRatio, 1 / imageSize.aspectRatio),
    );

    Offset offset = transformConfigs.offset / offsetFactor;
    double scale = fitCoverScale * transformConfigs.scaleUser;
    if (scale.isInfinite || scale.isNaN) scale = 1;
    if (offset.isInfinite) offset = Offset.zero;

    return Container(
      height: size.height,
      width: size.width,
      margin: margin,
      decoration: decoration,
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Transform.rotate(
          angle: transformConfigs.angle,
          alignment: Alignment.center,
          child: Transform.flip(
            flipX: transformConfigs.flipX,
            flipY: transformConfigs.flipY,
            child: Transform.scale(
              scale: scale,
              child: Transform.translate(
                offset: offset,
                child: _buildImage(
                  imageSize,
                  filter,
                  size,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImage(
      Size imageSize,
      FilterModel filter,
      Size size,
      ) {
    // Ensure that the matrix has exactly 20 entries



    return FilteredImage(
      image: widget.editorImage,
      fit: BoxFit.cover,
      width: size.width,
      height: size.height,
      filters: [
        ...(widget.activeFilters ?? []),
        ...filter.filters,
      ],
      configs: widget.configs,
      blurFactor: widget.blurFactor,
      colorFilterMatrix: _combinedMatrix,
    );
  }
}

/// A utility class for image adjustments.
class ImageAdjustmentFilterEditor  {
  ///
  static List<double> brightness(double brightness) {
    return [
      1, 0, 0, 0, brightness,
      0, 1, 0, 0, brightness,
      0, 0, 1, 0, brightness,
      0, 0, 0, 1, 0,
    ];
  }
///
  static List<double> contrast(double contrast) {
    double offset = (contrast + 1) * 0.5;
    return [
      contrast, 0, 0, 0, offset,
      0, contrast, 0, 0, offset,
      0, 0, contrast, 0, offset,
      0, 0, 0, 1, 0,
    ];
  }
///
  static List<double> temperature(double temperature) {
    double t = temperature;
    return [
      1 + t, 0, 0, 0, 0,
      0, 1 + t, 0, 0, 0,
      0, 0, 1 + t, 0, 0,
      0, 0, 0, 1, 0,
    ];
  }
}
