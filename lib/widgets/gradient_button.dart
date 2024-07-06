import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:v2/core/feature/color.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({
    super.key,
    this.title,
    this.onButtonPressed,
    this.icon,
    this.textStyle,
  });
  final VoidCallback? onButtonPressed;
  final String? title;
  final String? icon;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 33,
      // width: double.maxFinite,
      decoration: BoxDecoration(
          gradient: linearGradientColor,
          borderRadius: BorderRadius.circular(10)),
      child: ElevatedButton(
        onPressed: onButtonPressed,
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null)
              SvgPicture.asset(
                icon!,
                // width: 31,
                // height: 31,
              ),
            if (icon != null)
              const SizedBox(
                width: 10,
              ),
            Text(
              tr(title!),
            )
          ],
        ),
      ),
    );
  }
}
