import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/icons_string.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(60.0); // Set the height of the AppBar

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // Increase the height of the AppBar to fit larger images
      toolbarHeight: 60.0, // Adjust as needed
      automaticallyImplyLeading: false, // Remove default back button

      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: SvgPicture.asset(
              AppIcons.slash,
              width: 20.0,
              height: 20.0,
            ),
          ),
          Spacer(),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  AppIcons.location,
                  height: 30,
                  width: 30,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Naser City',
                    style: TextStyle(
                      fontFamily: 'Urbanist',
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Cairo',
                    style: TextStyle(
                      fontFamily: 'Urbanist',
                      fontSize: 14,
                      fontWeight:FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 8.0), // Add some spacing between text and icon
              SvgPicture.asset(AppIcons.more),
            ],
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: SvgPicture.asset(
              AppIcons.notification,
              width: 30.0,
              height: 30.0,
            ),
          ),
        ],
      ),
    );
  }
}
