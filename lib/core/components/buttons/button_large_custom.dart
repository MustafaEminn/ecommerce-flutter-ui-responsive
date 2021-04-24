import '../../base/state/base_state.dart';
import '../../constants/component/button_constants.dart';
import '../../init/theme/colors.dart';
import 'package:flutter/material.dart';

class ButtonLargeCustom extends StatefulWidget {
  final Widget child;
  final void Function()? onTap;
  static dynamic onTapDefault() {}

  const ButtonLargeCustom({
    Key? key,
    required this.child,
    this.onTap = onTapDefault,
  }) : super(key: key);
  @override
  _ButtonLargeCustomState createState() => _ButtonLargeCustomState();
}

class _ButtonLargeCustomState extends BaseState<ButtonLargeCustom> {
  Widget buttonContainer(Widget child) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: primary,
          borderRadius: BorderRadius.all(Radius.circular(
              dynamicWidth(ButtonConstants.BUTTON_BORDER_RADIUS)))),
      width: dynamicWidth(ButtonConstants.LARGE_BUTTON_WIDTH),
      height: dynamicHeight(ButtonConstants.LARGE_BUTTON_HEIGHT),
      child: child,
    );
  }

  Widget buttonInkWell(Widget child) {
    return InkWell(
      onTap: widget.onTap,
      child: child,
    );
  }

  Widget button() {
    return buttonInkWell(buttonContainer(widget.child));
  }

  @override
  Widget build(BuildContext context) {
    return button();
  }
}
