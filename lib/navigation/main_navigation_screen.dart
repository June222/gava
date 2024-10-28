import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gava/constants/colors.dart';
import 'package:gava/constants/gaps.dart';
import 'package:gava/constants/sizes.dart';
import 'package:gava/navigation/widgets/bottom_nav_tap.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({
    super.key,
  });

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  String username = "김지땡";

  final BorderRadius _bottomNavBarBorderRadius =
      BorderRadius.circular(Sizes.size24);
  final BorderRadius _topButtonRadius = BorderRadius.circular(Sizes.size12);
  int _selectedIndex = 0;

  int _month = 3;
  int _day = 11;

  final List<String> _TODOs = [
    "토양학 인강",
    "PAST 자료해석",
    "TOEIC 관련 영어 단어 1000개 외우기"
  ];

  final List<double> _paddingList = [
    Sizes.size96,
    Sizes.size96 + Sizes.size96,
    Sizes.size10,
  ];

  final List<IconData> _iconList = [
    FontAwesomeIcons.pencil,
    FontAwesomeIcons.pencil,
    FontAwesomeIcons.book,
  ];

  void _onSelectTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _changeMonthBefore() {
    _month -= 1;
    if (_month == 0) {
      _month = 12;
    }
    setState(() {});
  }

  void _changeDayBefore() {
    _day -= 1;
    if (_day == 0) {
      _day = 30;
      _changeMonthBefore();
    }
    setState(() {});
  }

  void _changeMonthAfter() {
    _month += 1;
    if (_month == 13) {
      _month = 1;
    }
    setState(() {});
  }

  void _changeDayAfter() {
    _day += 1;
    if (_day == 32) {
      _day = 1;
      _changeMonthAfter();
    }
    setState(() {});
  }

  void _addTodoTap() {
    _TODOs.add("다음 계획 어쩌고 저쩌고 ${_TODOs.length + 1}");
    _paddingList.add(Sizes.size60);
    _iconList.add(FontAwesomeIcons.accusoft);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: kToolbarHeight * 1.5,
          centerTitle: true,
          title: Row(
            children: [
              Image.asset(
                "assets/images/main_emoji.png",
                width: 65,
              ),
              Gaps.h10,
              Text("$username님"),
              Gaps.h10,
              const Text(
                "굿모닝!",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size10,
            vertical: Sizes.size10,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  ChangeDayWidget(
                    iconData: FontAwesomeIcons.chevronLeft,
                    function: _changeDayBefore,
                  ),
                  Gaps.h10,
                  Text(
                    "$_month월 $_day일",
                    style: const TextStyle(
                      fontSize: Sizes.size16,
                    ),
                  ),
                  Gaps.h10,
                  ChangeDayWidget(
                    iconData: FontAwesomeIcons.chevronRight,
                    function: _changeDayAfter,
                  ),
                  Expanded(child: Container()),
                  Container(
                    width: Sizes.size52,
                    decoration: BoxDecoration(
                      color: Constant.backgroundColor,
                      borderRadius: _topButtonRadius,
                    ),
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Day",
                        style: TextStyle(
                          fontSize: Sizes.size16,
                        ),
                      ),
                    ),
                  ),
                  Gaps.h10,
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: _topButtonRadius,
                    ),
                    child: IconButton(
                      onPressed: _addTodoTap,
                      icon: const FaIcon(FontAwesomeIcons.plus),
                      iconSize: Sizes.size14,
                    ),
                  ),
                ],
              ),
              Gaps.v10,
              Expanded(
                child: ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.only(right: _paddingList[index]),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: Sizes.size24,
                          vertical: Sizes.size20,
                        ),
                        decoration: BoxDecoration(
                          color: Constant.backgroundColor,
                          borderRadius: BorderRadius.circular(Sizes.size14),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            FaIcon(_iconList[index]),
                            Gaps.h16,
                            Text(_TODOs[index]),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Gaps.v10;
                  },
                  itemCount: _TODOs.length,
                ),
              ),
            ],
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

class ChangeDayWidget extends StatelessWidget {
  const ChangeDayWidget({
    super.key,
    required this.iconData,
    this.function,
  });

  final IconData iconData;
  final Function()? function;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Sizes.size40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Constant.backgroundColor,
      ),
      child: IconButton(
        onPressed: function,
        icon: FaIcon(
          iconData,
          size: Sizes.size14,
          color: Colors.white,
        ),
      ),
    );
  }
}
