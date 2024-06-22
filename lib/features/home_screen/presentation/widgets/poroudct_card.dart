import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:json_project/core/constants/icons_string.dart';
import '../../../../core/constants/colors.dart';

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String productName;
  final String price;

  ProductCard({
    required this.imageUrl,
    required this.productName,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Card(
          color: Colors.white,
          margin: const EdgeInsets.all(10.0),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    child: Image.asset(
                      imageUrl,
                      height: constraints.maxWidth * 0.9, // Height relative to the width
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    right: 10.0,
                    top: 10.0,
                    child: CircleAvatar(
                      child: IconButton(
                        icon: SvgPicture.asset(
                          AppIcons.like,
                          width: constraints.maxWidth * 0.1, // Adjust size relative to the width
                        ),
                        onPressed: () {
                          // Handle like button press
                        },
                      ),
                      backgroundColor: Colors.grey[200],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productName,
                      style: TextStyle(
                        fontSize: constraints.maxWidth * 0.07, // Adjust font size relative to the width
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Row(
                      children: [
                        Text(
                          "EGP " + price,
                          style: TextStyle(
                            fontSize: constraints.maxWidth * 0.06, // Adjust font size relative to the width
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4),
                          child: CircleAvatar(
                            radius: 19,
                            foregroundColor: Colors.grey,
                            backgroundColor: Colors.grey,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: CircleAvatar(
                            radius: 19,
                            backgroundColor: Colors.black87,
                            child: Center(
                              child: SvgPicture.asset(
                                AppIcons.add,
                                width: constraints.maxWidth * 0.05, // Adjust size relative to the width
                                height: constraints.maxWidth * 0.05,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
