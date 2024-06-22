import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:json_project/core/constants/icons_string.dart';

import '../../../../core/constants/colors.dart';

class SearchFilterWidget extends StatefulWidget {
  @override
  _SearchFilterWidgetState createState() => _SearchFilterWidgetState();
}

class _SearchFilterWidgetState extends State<SearchFilterWidget> {
  TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey[200], // Background color of the search bar
              borderRadius: BorderRadius.circular(10.0),
            ),
            padding: EdgeInsets.symmetric(horizontal: 16.0), // Padding for the container
            child: Row(
              children: <Widget>[
                SvgPicture.asset(
                  AppIcons.search,
                  height: 20, // Decreased icon size
                  width: 20, // Decreased icon size
                ),
                SizedBox(width: 10), // Space between icon and text field
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search Here..',
                      hintStyle: TextStyle(color: Colors.grey[400]), // Hint text color
                      border: InputBorder.none, // Remove border
                      enabledBorder: InputBorder.none, // Remove enabled border
                      focusedBorder: InputBorder.none, // Remove focused border
                      isDense: true, // Reduce the height of the text field
                      contentPadding: EdgeInsets.all(0), // No internal padding
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 10.0),
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.grey[200], // Background color of the filter button
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Center(
            child: InkWell(
              onTap: () {
                // Handle filter button tap
              },
              child: SvgPicture.asset(
                'assets/icons/filter.svg',
                width: 20.0, // Adjust icon size
                height: 20.0, // Adjust icon size
              ),
            ),
          ),
        )
      ],
    );
  }
}
