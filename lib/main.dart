import 'package:flutter/material.dart';
import 'cart.dart';
import 'table.dart';
import 'main_home.dart';
import 'add.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MainApp> {
  int _selectedIndex = 0;

  late List<Widget> _children;

  @override
  void initState() {
    super.initState();
    _children = [
      MainHome(),
      cart(),
      tables(updateIndex: updateIndex),
      add(),
    ];
  }

  void updateIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: _children[_selectedIndex],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Isi',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Table',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
