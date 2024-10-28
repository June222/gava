import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gava/constants/colors.dart';
import 'package:gava/constants/gaps.dart';
import 'package:gava/constants/sizes.dart';

class BottomNavTap extends StatelessWidget {
  const BottomNavTap({
    super.key,
    required BorderRadius radius,
    required IconData iconData,
    required this.isSelected,
    this.onTap,
    required this.text,
  })  : _bottomNavBarBorderRadius = radius,
        _iconData = iconData;

  final BorderRadius _bottomNavBarBorderRadius;
  final IconData _iconData;
  final bool isSelected;
  final String text;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    const Duration duration = Duration(milliseconds: 300);
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: duration,
        padding: isSelected
            ? const EdgeInsets.symmetric(
                vertical: Sizes.size20,
                horizontal: Sizes.size60,
              )
            : const EdgeInsets.symmetric(
                vertical: Sizes.size20,
                horizontal: 0,
              ),
        decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).primaryColor
              : Constant.backgroundColor,
          borderRadius: _bottomNavBarBorderRadius,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: isSelected
                  ? null
                  : const EdgeInsets.symmetric(horizontal: Sizes.size28),
              child: FaIcon(
                _iconData,
                color: isSelected ? Colors.white : Colors.grey,
              ),
            ),
            Gaps.h5,
            if (isSelected) Text(text),
          ],
        ),
      ),
    );
  }
}
