import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Import the flutter_svg package

import '../widgets/app_bar.dart'; // Make sure to adjust path as necessary
import 'home_view.dart'; // Make sure to adjust path as necessary

class enter_secreen extends StatefulWidget {
  const enter_secreen({Key? key}) : super(key: key);

  @override
  _enter_secreenState createState() => _enter_secreenState();
}

class _enter_secreenState extends State<enter_secreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    const ShopPage(),
    const CartPage(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(), // Assuming CustomAppBar is correctly implemented or imported
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _buildBottomNavigationBarItems(),
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        showSelectedLabels: true,
        showUnselectedLabels: true,
      ),
    );
  }

  List<BottomNavigationBarItem> _buildBottomNavigationBarItems() {
    const List<String> icons = [
      'assets/icons/home.svg', // Replace with your SVG paths
      'assets/icons/like.svg',
      'assets/icons/cart.svg',
      'assets/icons/profile.svg',
    ];

    const List<String> labels = [
      'Home',
      'Favorites',
      'My Cart',
      'Profile',
    ];

    return List.generate(icons.length, (index) {
      return BottomNavigationBarItem(
        icon: Column(
          children: [
            if (_selectedIndex == index)
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black,
                ),
                height: 3,
                width: MediaQuery.of(context).size.width * 0.2,
              ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                icons[index],
                height: 24, // Adjust height as needed
                width: 24, // Adjust width as needed
                color: _selectedIndex == index ? Colors.black : Colors.grey,
              ),
            ),
          ],
        ),
        label: labels[index],

      );
    });
  }
}

class ShopPage extends StatelessWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Shop Page'));
  }
}

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Cart Page'));
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Profile Page'));
  }
}
