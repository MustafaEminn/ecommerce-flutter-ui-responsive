import '../../base/state/base_state.dart';
import '../../base/widgets/base_widget.dart';
import '../../constants/app/app_constants.dart';
import '../../constants/component/input_constants.dart';
import '../../init/theme/colors.dart';
import 'package:flutter/material.dart';

class DoubleInput extends StatefulWidget {
  final Widget? icon1;
  final String? placeholder1;
  final TextInputType? keyboardType1;
  final void Function(bool hasFocus) onFocusChange1;
  final Widget? icon2;
  final String? placeholder2;
  final TextInputType? keyboardType2;
  final void Function(bool hasFocus) onFocusChange2;

  static dynamic _dummyOnFocusChange(bool val) {}

  DoubleInput({
    Key? key,
    this.icon1,
    this.placeholder1,
    this.keyboardType1 = TextInputType.text,
    this.onFocusChange1 = _dummyOnFocusChange,
    this.icon2,
    this.placeholder2,
    this.keyboardType2 = TextInputType.text,
    this.onFocusChange2 = _dummyOnFocusChange,
  }) : super(key: key);
  @override
  _DoubleInputState createState() => _DoubleInputState();
}

class _DoubleInputState extends BaseState<DoubleInput> {
  Widget textField1() {
    BorderRadius borderRadius = BorderRadius.all(
        Radius.circular(dynamicWidth(InputConstants.INPUT_BORDER_RADIUS)));

    double borderWidth = dynamicWidth(0.0055);
    return Container(
      decoration: BoxDecoration(
        color: white,
        borderRadius: borderRadius,
      ),
      child: Focus(
        onFocusChange: (hasFocus) {
          widget.onFocusChange1(hasFocus);
        },
        child: TextField(
          cursorColor: black,
          keyboardType: widget.keyboardType1,
          style: TextStyle(
              fontSize: dynamicWidth(ApplicationConstants.TEXT_HEADER_S)),
          decoration: InputDecoration(
              hintText: widget.placeholder1,
              hintStyle: TextStyle(color: grey),
              prefixIcon: widget.icon1,
              contentPadding: EdgeInsets.symmetric(
                  horizontal: dynamicWidth(0.04),
                  vertical: dynamicHeight(0.022)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: borderRadius,
                  borderSide: BorderSide(color: grey, width: borderWidth)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: borderRadius,
                  borderSide: BorderSide(color: black, width: borderWidth))),
        ),
      ),
    );
  }

  Widget inputContainer1() {
    return Container(
      width: dynamicWidth(InputConstants.DOUBLE_INPUT_ONLY_WIDTH),
      height: dynamicHeight(InputConstants.DOUBLE_INPUT_ONLY_HEIGHT),
      child: textField1(),
    );
  }

  Widget textField2() {
    BorderRadius borderRadius = BorderRadius.all(
        Radius.circular(dynamicWidth(InputConstants.INPUT_BORDER_RADIUS)));

    double borderWidth = dynamicWidth(0.0055);
    return Container(
      decoration: BoxDecoration(
        color: white,
        borderRadius: borderRadius,
      ),
      child: Focus(
        onFocusChange: (hasFocus) {
          widget.onFocusChange1(hasFocus);
        },
        child: TextField(
          cursorColor: black,
          keyboardType: widget.keyboardType2,
          style: TextStyle(
              fontSize: dynamicWidth(ApplicationConstants.TEXT_HEADER_S)),
          decoration: InputDecoration(
              hintText: widget.placeholder2,
              hintStyle: TextStyle(color: grey),
              prefixIcon: widget.icon2,
              contentPadding: EdgeInsets.symmetric(
                  horizontal: dynamicWidth(0.04),
                  vertical: dynamicHeight(0.022)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: borderRadius,
                  borderSide: BorderSide(color: grey, width: borderWidth)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: borderRadius,
                  borderSide: BorderSide(color: black, width: borderWidth))),
        ),
      ),
    );
  }

  Widget inputContainer2() {
    return Container(
      width: dynamicWidth(InputConstants.DOUBLE_INPUT_ONLY_WIDTH),
      height: dynamicHeight(InputConstants.DOUBLE_INPUT_ONLY_HEIGHT),
      child: textField2(),
    );
  }

  Widget inputsRowContainer() {
    return Container(
      width: dynamicWidth(InputConstants.LARGE_INPUT_WIDTH),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [inputContainer1(), inputContainer2()],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      onPageBuilder: (context) {
        return inputsRowContainer();
      },
    );
  }
}
