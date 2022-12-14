import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:app_masterclass/app/theme_controller.dart';

// ignore: must_be_immutable
class HeaderPageWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  bool isDetailPage;
  HeaderPageWidget({
    super.key,
    required this.title,
    this.isDetailPage = false,
  });
  final double height = 90.0;
  @override
  Widget build(BuildContext context) {
    final controller =
        context.dependOnInheritedWidgetOfExactType<ThemeController>()!;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: SizedBox(
            height: 70,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    if (isDetailPage)
                      Padding(
                          padding: const EdgeInsets.only(right: 4.0),
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.arrow_back_ios, size: 28),
                          ))
                    else
                      Padding(
                        padding: const EdgeInsets.only(right: 4.0),
                        child: Image.asset(
                          'assets/logo.png',
                          height: 44,
                          width: 44,
                        ),
                      ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          'Fluterando Masterclass',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    controller.toggle();
                  },
                  icon: const Icon(FontAwesomeIcons.solidMoon, size: 28),
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: 20)
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
