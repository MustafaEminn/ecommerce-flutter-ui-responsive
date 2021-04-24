import 'package:flutter/material.dart';

import '../../base/state/base_state.dart';
import '../../constants/app/app_constants.dart';

class TextCustom extends StatefulWidget {
  final String text;
  final Color? color;
  final FontWeight? weight;
  final TextStyle? style;
  final TextOverflow? overflow;
  final double size;

  const TextCustom(
      {Key? key,
      required this.text,
      this.color,
      this.style,
      this.overflow,
      this.weight = FontWeight.w400,
      this.size = ApplicationConstants.TEXT_HEADER_S})
      : super(key: key);
  @override
  _TextCustomState createState() => _TextCustomState();
}

class _TextCustomState extends BaseState<TextCustom> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      overflow: widget.overflow,
      style: widget.style == null
          ? TextStyle(
              fontSize: dynamicWidth(widget.size),
              color: widget.color,
              fontWeight: widget.weight)
          : widget.style,
    );
  }
}
