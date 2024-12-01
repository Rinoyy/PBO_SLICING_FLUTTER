import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'cart.dart';
import 'table.dart';
import 'home.dart';
import 'add.dart';

const supabaseUrl = 'https://epopsemnhgkifhyroxcx.supabase.co';
const supabaseKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVwb3BzZW1uaGdraWZoeXJveGN4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzI2ODM5NDMsImV4cCI6MjA0ODI1OTk0M30.23moln--71tbeVzaeoelN7hkJWOwzeePJTL9ayNR4Lo';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inisialisasi Supabase
  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseKey,
  );

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
      AddScreen(), // Ganti `MyApp` dengan `AddScreen`
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
