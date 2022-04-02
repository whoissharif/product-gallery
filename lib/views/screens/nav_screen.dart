import 'package:flutter/material.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({Key? key}) : super(key: key);

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  int _selectedIndex = 1;

  static const List<Widget> _pages = <Widget>[
    Center(
        child: Text('Home',
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold))),
    Center(
      child: Text('Explore',
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    ),
    Center(
        child: Text('Add',
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold))),
    Center(
        child: Text('Inbox',
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold))),
    Center(
        child: Text('Shop',
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.red,
        type: BottomNavigationBarType.fixed,
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.explore_outlined), label: 'Explore'),
          BottomNavigationBarItem(
            icon: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.black, shape: BoxShape.circle),
                padding: const EdgeInsets.all(15),
                child: const Icon(Icons.add, color: Colors.white),
              ),
            ),
            label: '',
          ),
          const BottomNavigationBarItem(
              icon: Icon(Icons.forward_to_inbox), label: 'Inbox'),
          const BottomNavigationBarItem(icon: Icon(Icons.shop_outlined), label: 'Shop'),
        ],
      ),
    );
  }
}
