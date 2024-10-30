import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gava/constants/colors.dart';
import 'package:gava/constants/gaps.dart';
import 'package:gava/constants/sizes.dart';
import 'package:gava/navigation/home_screen.dart';
import 'package:gava/navigation/widgets/bottom_nav_tap.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({
    super.key,
  });

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  final BorderRadius _bottomNavBarBorderRadius =
      BorderRadius.circular(Sizes.size24);
  int _selectedIndex = 0;
  final format = DateFormat.yMEd('ko_KR');

  void _onSelectTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // log(format.toString());
    // var dateString = format.format(DateTime.now());
    // log(dateString);
    // log(DateFormat('E', 'ko_KR').format(DateTime.now()));
    // var width = MediaQuery.of(context).size.width;

    return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size10,
              vertical: Sizes.size10,
            ),
            child: Stack(
              children: [
                Offstage(
                  offstage: _selectedIndex != 0,
                  child: const HomeScreen(),
                ),
                Offstage(
                  offstage: _selectedIndex != 1,
                  child: Center(
                    child: Text("$_selectedIndex"),
                  ),
                ),
                Offstage(
                  offstage: _selectedIndex != 2,
                  child: Center(
                    child: Text("$_selectedIndex"),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.size12,
            horizontal: Sizes.size10,
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: Sizes.size5,
              horizontal: Sizes.size5,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFF191919),
              // TODO: 바깥의 Radius가 안쪽의 radius보다 커야함.
              borderRadius: _bottomNavBarBorderRadius.copyWith(
                topLeft: const Radius.circular(Sizes.size28),
                bottomLeft: const Radius.circular(Sizes.size28),
                topRight: const Radius.circular(Sizes.size28),
                bottomRight: const Radius.circular(Sizes.size28),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BottomNavTap(
                  iconData: FontAwesomeIcons.house,
                  text: "Home",
                  radius: _bottomNavBarBorderRadius,
                  isSelected: _selectedIndex == 0,
                  onTap: () => _onSelectTap(0),
                ),
                BottomNavTap(
                  radius: _bottomNavBarBorderRadius,
                  text: "Calendar",
                  iconData: FontAwesomeIcons.calendar,
                  isSelected: _selectedIndex == 1,
                  onTap: () => _onSelectTap(1),
                ),
                BottomNavTap(
                  iconData: FontAwesomeIcons.solidUser,
                  text: "User",
                  radius: _bottomNavBarBorderRadius,
                  isSelected: _selectedIndex == 2,
                  onTap: () => _onSelectTap(2),
                ),
              ],
            ),
          ),
        ));
  }
}
