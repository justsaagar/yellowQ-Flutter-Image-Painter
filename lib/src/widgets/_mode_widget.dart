import 'package:flutter/material.dart';

import '../../image_painter.dart';

class SelectionItems extends StatelessWidget {
  final bool isSelected;
  final ModeData data;
  final VoidCallback? onTap;
  final Color? selectedColor;
  final Color? selectedBackColor;
  final Color? unselectedColor;

  const SelectionItems({
    required this.data,
    Key? key,
    this.isSelected = false,
    this.onTap,
    this.selectedColor,
    this.selectedBackColor,
    this.unselectedColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          margin: const EdgeInsets.symmetric(vertical: 2.0),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(4.0), color: isSelected ? (selectedBackColor ?? Colors.grey) : Colors.transparent),
          child: Icon(
            data.icon,
            color: isSelected ? selectedColor ?? Colors.white : unselectedColor ?? Colors.black,
          ),
        ),
      ),
    );
  }
}

List<ModeData> paintModes(TextDelegate textDelegate) => [
      ModeData(icon: Icons.zoom_out_map, mode: PaintMode.none, label: textDelegate.noneZoom),
      ModeData(icon: Icons.horizontal_rule, mode: PaintMode.line, label: textDelegate.line),
      ModeData(icon: Icons.crop_free, mode: PaintMode.rect, label: textDelegate.rectangle),
      ModeData(icon: Icons.edit, mode: PaintMode.freeStyle, label: textDelegate.drawing),
      ModeData(icon: Icons.lens_outlined, mode: PaintMode.circle, label: textDelegate.circle),
      ModeData(icon: Icons.arrow_right_alt_outlined, mode: PaintMode.arrow, label: textDelegate.arrow),
      ModeData(icon: Icons.power_input, mode: PaintMode.dashLine, label: textDelegate.dashLine),
      ModeData(icon: Icons.text_format, mode: PaintMode.text, label: textDelegate.text),
    ];

class ModeData {
  const ModeData({
    required this.icon,
    required this.mode,
    required this.label,
  });
  final IconData icon;
  final PaintMode mode;
  final String label;
}
