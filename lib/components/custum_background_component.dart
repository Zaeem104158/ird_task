import 'package:flutter/material.dart';

class CustomBackgroundComponent extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final Gradient? linearGradientColor;
  final double? bottomLeft;
  final double? bottomRight;
  final double? topLeft;
  final double? topRight;
  final EdgeInsets? padding;

  const CustomBackgroundComponent({
    Key? key,
    this.height,
    this.width,
    this.backgroundColor,
    this.linearGradientColor,
    this.bottomLeft,
    this.bottomRight,
    this.topLeft,
    this.topRight,
    this.padding,
  });
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: padding,
      height: height,
      width: width,
            decoration: BoxDecoration(
              color: backgroundColor,
              gradient: linearGradientColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(topLeft ?? 0),
                  topRight: Radius.circular(topRight ?? 0),
                  bottomRight: Radius.circular(bottomRight ?? 0),
                  bottomLeft: Radius.circular(bottomLeft ?? 0)),     
            ),
    );
  }
}
