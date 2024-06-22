import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SaleSection extends StatefulWidget {
  @override
  State<SaleSection> createState() => _SaleSectionState();
}

class _SaleSectionState extends State<SaleSection> {
  final List<String> imgList = [
    'assets/images/hot_deal.jpg',
    'assets/images/hot_deal.jpg',
    'assets/images/hot_deal.jpg',
  ];

  int _current = 0;

  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double aspectRatio = constraints.maxWidth / 200; // Dynamic aspect ratio based on width
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              items: imgList.map((item) => Container(
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image.asset(
                      item,
                      fit: BoxFit.cover,
                      width: constraints.maxWidth, // Full width of the parent
                      height: constraints.maxWidth / aspectRatio, // Height based on the dynamic aspect ratio
                    ),
                  ),
                ),
              )).toList(),
              carouselController: _controller,
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: aspectRatio, // Dynamic aspect ratio
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imgList.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: Container(
                    width: constraints.maxWidth * 0.02, // Responsive width
                    height: constraints.maxWidth * 0.01, // Responsive height
                    margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(4.0), // Rectangular shape
                      color: (Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black)
                          .withOpacity(_current == entry.key ? 0.9 : 0.4),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        );
      },
    );
  }
}
