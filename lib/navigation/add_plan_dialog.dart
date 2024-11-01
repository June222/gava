import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gava/constants/gaps.dart';
import 'package:gava/constants/sizes.dart';

class AddPlanDialog extends StatefulWidget {
  const AddPlanDialog({
    super.key,
  });

  @override
  State<AddPlanDialog> createState() => _AddPlanDialogState();
}

class _AddPlanDialogState extends State<AddPlanDialog> {
  final double _spacing = Sizes.size40;

  void _unfocus(PointerDownEvent event) => FocusScope.of(context).unfocus();

  final int _selectedCategory = 0;
  int _selectedIconIndex = 0;

  void _onIconTap() async {
    List<IconData?> returnData;

    returnData = await showModalBottomSheet(
        // backgroundColor: const Color(0xFF191919),
        // barrierColor: Colors.black26,
        // shape: const BeveledRectangleBorder(
        //   side: BorderSide(),
        //   borderRadius: BorderRadius.only(
        //     topLeft: Radius.circular(10),
        //     topRight: Radius.circular(10),
        //   ),
        // ),
        elevation: 10,
        context: context,
        builder: (context) {
          IconData? returnData;
          return SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: Sizes.size20),
                  width: Sizes.size96,
                  height: Sizes.size5,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(Sizes.size16),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Sizes.size20,
                      vertical: Sizes.size12,
                    ),
                    child: Wrap(
                      spacing: _spacing,
                      runSpacing: Sizes.size12,
                      children: [
                        GestureDetector(
                          onTap: () {
                            _selectedIconIndex = 0;
                            returnData = FontAwesomeIcons.pencil;
                            setState(() {});
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: _selectedIconIndex == 0
                                    ? Theme.of(context).primaryColor
                                    : Colors.transparent,
                              ),
                            ),
                            child: const FaIcon(
                              FontAwesomeIcons.pencil,
                              size: Sizes.size40,
                            ),
                          ),
                        ),
                        Container(
                          child: const FaIcon(
                            FontAwesomeIcons.paperclip,
                            size: Sizes.size40,
                          ),
                        ),
                        Container(
                          child: const FaIcon(
                            FontAwesomeIcons.book,
                            size: Sizes.size40,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Gaps.v10,
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Sizes.size20,
                      vertical: Sizes.size12,
                    ),
                    child: Wrap(
                      spacing: _spacing,
                      runSpacing: Sizes.size12,
                      children: [
                        Container(
                          width: Sizes.size40,
                          height: Sizes.size40,
                          decoration: const BoxDecoration(
                            color: Colors.grey,
                            shape: BoxShape.circle,
                          ),
                        ),
                        Container(
                          width: Sizes.size40,
                          height: Sizes.size40,
                          decoration: const BoxDecoration(
                            color: Colors.grey,
                            shape: BoxShape.circle,
                          ),
                        ),
                        Container(
                          width: Sizes.size40,
                          height: Sizes.size40,
                          decoration: const BoxDecoration(
                            color: Colors.grey,
                            shape: BoxShape.circle,
                          ),
                        ),
                        Container(
                          width: Sizes.size40,
                          height: Sizes.size40,
                          decoration: const BoxDecoration(
                            color: Colors.grey,
                            shape: BoxShape.circle,
                          ),
                        ),
                        Container(
                          width: Sizes.size40,
                          height: Sizes.size40,
                          decoration: const BoxDecoration(
                            color: Colors.grey,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Expanded(child: SizedBox()),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, [returnData]);
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      Theme.of(context).primaryColor,
                    ),
                  ),
                  child: const Text("확인"),
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: const Color(0xFF121212),
        centerTitle: true,
        title: const Text("계획 생성하기"),
        // elevation: 1,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size20,
            vertical: Sizes.size10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("계획 제목"),
              Gaps.v10,
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF191919),
                  border: Border.all(
                    color: Colors.white10,
                  ),
                  borderRadius: BorderRadius.circular(13),
                ),
                child: TextField(
                  onTapOutside: _unfocus,
                  decoration: InputDecoration(
                    icon: GestureDetector(
                      onTap: _onIconTap,
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: Sizes.size20),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            FaIcon(FontAwesomeIcons.pencil),
                            Gaps.h10,
                            FaIcon(
                              FontAwesomeIcons.chevronDown,
                              size: 10,
                            )
                          ],
                        ),
                      ),
                    ),
                    border:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),
              const Text('선택'),
              Row(
                children: [
                  Container(
                      decoration: const BoxDecoration(
                        color: Colors.teal,
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: Sizes.size10,
                        horizontal: Sizes.size20,
                      ),
                      child: const Text("1")),
                  Container(
                      decoration: const BoxDecoration(
                        color: Colors.teal,
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: Sizes.size10,
                        horizontal: Sizes.size20,
                      ),
                      child: const Text("1")),
                  Container(
                      decoration: const BoxDecoration(
                        color: Colors.teal,
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: Sizes.size10,
                        horizontal: Sizes.size20,
                      ),
                      child: const Text("1")),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
