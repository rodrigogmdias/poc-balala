import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  SideBar({super.key});

  final _listsButtons = [
    Icons.home,
    Icons.list,
    Icons.add,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        border: Border(
          right: BorderSide(
            color: Theme.of(context).dividerColor,
            width: 1,
          ),
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: _listsButtons.length,
              shrinkWrap: true,
              padding: const EdgeInsets.all(8),
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) => Icon(
                _listsButtons[index],
                color: index == 0
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).disabledColor,
                size: 32,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Divider(),
                Icon(
                  Icons.supervised_user_circle_rounded,
                  color: Theme.of(context).disabledColor,
                  size: 32,
                ),
                const Divider(),
                Icon(
                  Icons.settings,
                  color: Theme.of(context).disabledColor,
                  size: 32,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
