import 'package:flutter/material.dart';
import 'package:my_app/dto/news.dart';
import 'package:my_app/screens/CRUD/test_crud.dart';
import 'package:my_app/screens/about.dart';
import 'package:my_app/screens/dashboard_screen.dart';
import 'package:my_app/screens/login_screen.dart';
import 'package:my_app/screens/news_screen.dart';
import 'package:my_app/screens/makanan_screen.dart';
import 'package:my_app/screens/CRUD/total_pemesanan_screen.dart';
import 'package:my_app/screens/riwayat_screen.dart';
import 'package:my_app/screens/splash_screen.dart';

void main() {
  runApp(const MyApp2());
}

class MyApp2 extends StatelessWidget {
  const MyApp2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false, //matiin debug icon
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Home Screen'),
      routes: {
        '/news_screen':(context) => const NewsScreen()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    
    const dashboardScreen(),
    const MakananScreen(),
    const Riwayat(),
  ];

  final List<String> _appBarTitles = const [
    'Dashboard',
    'Makanan',
    'Riwayat',
  ]; // List of titles corresponding to each screen

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitles[_selectedIndex]),
      ),

      body: _screens[_selectedIndex],
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                        'https://avatars.githubusercontent.com/u/161729145?v=4'), // Ganti dengan URL foto profil Anda
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Gede Yogi Indra Permana',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            
            ListTile(
              title: const Text('Home'),
              selected: _selectedIndex == 0,
              onTap: () {
                // Update the state of the app
                _onItemTapped(0);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),

            ListTile(
              title: const Text('About us'),
              selected: _selectedIndex == 0,
              onTap: () {
                // Update the state of the app
                _onItemTapped(0);
                // Then close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const About()),
                );
              },
            ),

            ListTile(
              title: const Text('Latihan API'),
              selected: _selectedIndex == 0,
              onTap: () {
                // Update the state of the app
                _onItemTapped(0);
                // Then close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NewsScreen()),
                );
              },
            ),

            ListTile(
              title: const Text('Latihan CRUD'),
              selected: _selectedIndex == 0,
              onTap: () {
                // Update the state of the app
                _onItemTapped(0);
                // Then close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Pesanan()),
                );
              },
            ),
            
            ListTile(
              title: const Text('Log Out'),
              selected: _selectedIndex == 1,
              onTap: () {
                // Update the state of the app
                _onItemTapped(0);
                // Then close the drawer
               Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) {
          return LoginScreen();
        }),
      );
              },
            ),]),
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Makanan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.payment),
            label: 'Riwayat',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
