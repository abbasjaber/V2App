import 'package:flutter/material.dart';

class CustomBottomNavigationBarItem extends StatelessWidget {
  const CustomBottomNavigationBarItem(
      {super.key,
      this.activeIcon,
      this.icon,
      this.label,
      this.index,
      this.currentIndex,
      this.callbackAction});

  final Widget? activeIcon;
  final Widget? icon;
  final String? label;
  final int? index;
  final int? currentIndex;
  final Function? callbackAction;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          currentIndex! == index! ? activeIcon! : icon!,
          SizedBox(
            width: label!.length > 10 && label!.length < 20
                ? 55
                : label!.length > 20
                    ? 95
                    : null,
            child: Text(
              label!,
              softWrap: true,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 12,
                  color: currentIndex! == index ? Colors.red : Colors.grey),
            ),
          ),
        ],
      ),
      onPressed: () => callbackAction!(index),
    );
  }
}
