// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppSvgIcon extends StatelessWidget {
  final Color? color;
  final String icon;
  final double? width;
  final double? height;

  const AppSvgIcon(this.icon,
      {super.key, this.color, this.width = 24, this.height = 24});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icon/$icon.svg',
      fit: BoxFit.fitHeight,
      width: width,
      height: height,
      colorFilter:
          color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
    );
  }
}
