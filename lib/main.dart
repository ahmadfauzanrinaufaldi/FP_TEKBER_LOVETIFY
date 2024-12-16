import 'package:flutter/material.dart';
import 'library_page.dart';
import 'top_page.dart';
import 'stats_page.dart';
import 'splash_screen.dart';
import 'login_page.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'hive_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('userBox'); // Membuka box untuk menyimpan data pengguna

  final hiveHelper = HiveHelper();
  hiveHelper.addDummyUser(); // Tambahkan pengguna dummy

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFF121212),
        primaryColor: Color(0xFF1DB954),
        fontFamily: 'RobotoSlab',
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.grey[300]),
          bodyLarge: TextStyle(color: Colors.white),
        ),
        colorScheme: ColorScheme.dark(
          primary: Color(0xFF1DB954),
          surface: Colors.grey[850] ?? Colors.grey, // Menambahkan nilai default
          onSurface: Colors.white,
        ),
      ),
      home: LoginPage(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    LibraryPage(),
    TopPage(),
    StatsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 500),
        transitionBuilder: (widget, animation) {
          return FadeTransition(opacity: animation, child: widget);
        },
        child: _pages[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: Colors.grey[900],
        selectedItemColor: Color(0xFF1DB954),
        unselectedItemColor: Colors.grey[500],
        type: BottomNavigationBarType.fixed,
        elevation: 10,
        selectedLabelStyle:
            TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        unselectedLabelStyle: TextStyle(fontSize: 12),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.library_music),
            label: 'Library',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_rounded),
            label: 'Top',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.graphic_eq),
            label: 'Stats',
          ),
        ],
      ),
    );
  }
}
