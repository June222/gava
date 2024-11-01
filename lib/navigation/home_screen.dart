import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gava/constants/colors.dart';
import 'package:gava/constants/gaps.dart';
import 'package:gava/constants/sizes.dart';
import 'package:gava/navigation/add_plan_dialog.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String username = "김지땡";
  final BorderRadius _topButtonRadius = BorderRadius.circular(Sizes.size12);

  CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();

  final DateTime _firstDay = DateTime(1900);
  final DateTime _lastDay = DateTime(2100);

  Map<CalendarFormat, String> availableCalendarFormats = const {
    CalendarFormat.month: 'Month',
    CalendarFormat.twoWeeks: '2 weeks',
    CalendarFormat.week: 'Week',
  };

  final List<dynamic> _notifications = [
    {
      "todo": "토양학 인강",
      "padding": Sizes.size96,
      "icon": FontAwesomeIcons.pencil,
    },
    {
      "todo": "PAST 자료해석",
      "padding": Sizes.size96 + Sizes.size96,
      "icon": FontAwesomeIcons.book,
    },
    {
      "todo": "TOEIC 관련 영어 단어 1000개 외우기",
      "padding": Sizes.size10,
      "icon": FontAwesomeIcons.book,
    },
  ];

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

  void _addTodoTap() {
    // _notifications.add(
    //   {
    //     "todo": "다음 계획 어쩌고 저쩌고 ${_notifications.length + 1}",
    //     "padding": Sizes.size60,
    //     "icon": FontAwesomeIcons.accusoft,
    //   },
    // );
    // setState(() {});

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddPlanDialog()),
    );

    // showBottomSheet(
    //   context: context,
    //   builder: (context) => const AddPlanDialog(),
    // );
  }

  void _onFormatChanged(CalendarFormat newFormat) {
    setState(() {
      _calendarFormat = newFormat;
    });
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _selectedDay = selectedDay;
      _focusedDay = focusedDay;
    });
  }

  void _onPageChanged(DateTime focusedDay) {
    setState(() {
      _focusedDay = focusedDay;
    });
  }

  void _removeNotification(dynamic notification) {
    _notifications.remove(notification);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    log(_focusedDay.toString().split(' ')[0]);
    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              "assets/images/main_emoji.png",
              width: 45,
            ),
            Gaps.h10,
            Text(
              "$username님 굿모닝!",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            Expanded(child: Container()),
            Container(
              width: Sizes.size52,
              decoration: BoxDecoration(
                color: Constant.backgroundColor,
                borderRadius: _topButtonRadius,
              ),
              child: TextButton(
                onPressed: () async {
                  await showDialog(
                    context: context,
                    builder: (context) => const Stack(
                      children: [
                        Text("1"),
                      ],
                    ),
                  );
                },
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
        TableCalendar(
          locale: 'ko_KR',
          focusedDay: _focusedDay,
          firstDay: _firstDay,
          lastDay: _lastDay,
          calendarFormat: _calendarFormat,
          onFormatChanged: _onFormatChanged,
          onDaySelected: _onDaySelected,
          onPageChanged: _onPageChanged,
          selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
          calendarStyle: CalendarStyle(
              isTodayHighlighted: true,
              todayDecoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.4),
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                shape: BoxShape.circle,
              ),
              weekendTextStyle: const TextStyle(color: Colors.red)),
          headerStyle: const HeaderStyle(
            titleCentered: true,
            leftChevronVisible: false,
            rightChevronVisible: false,
            formatButtonVisible: false,
          ),
        ),
        Gaps.v10,
        Expanded(
          child: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                key: Key(_notifications[index].toString()),
                onDismissed: (direction) =>
                    _removeNotification(_notifications[index]),
                child: Padding(
                  padding:
                      EdgeInsets.only(right: _notifications[index]["padding"]),
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
                        FaIcon(_notifications[index]["icon"]),
                        Gaps.h16,
                        Text(_notifications[index]["todo"]),
                      ],
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) => Gaps.v10,
            itemCount: _notifications.length,
          ),
        )
      ],
    );
  }
}



// Positioned(
//           bottom: 0,
//           child: Column(
//             children: [
//               Container(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: Sizes.size32,
//                   vertical: Sizes.size10,
//                 ),
//                 decoration: BoxDecoration(
//                   color: Theme.of(context).primaryColor,
//                   borderRadius: const BorderRadius.only(
//                     topLeft: Radius.circular(10),
//                     topRight: Radius.circular(10),
//                   ),
//                 ),
//                 child: const Text("Day"),
//               ),
//               Container(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: Sizes.size32,
//                   vertical: Sizes.size10,
//                 ),
//                 color: Theme.of(context).primaryColor,
//                 child: const Text("Day"),
//               ),
//               Container(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: Sizes.size32,
//                   vertical: Sizes.size10,
//                 ),
//                 decoration: BoxDecoration(
//                   color: Theme.of(context).primaryColor,
//                   borderRadius: const BorderRadius.only(
//                     bottomLeft: Radius.circular(10),
//                     bottomRight: Radius.circular(10),
//                   ),
//                 ),
//                 child: const Text("Day"),
//               ),
//             ],
//           ),
//         ),