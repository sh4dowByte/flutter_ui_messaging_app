import 'package:flutter/material.dart';
import 'package:flutter_ui_messaging_app/widget/app_svg_icon.dart';
import '../config/pallete.dart';
import 'screen.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  int _currentIndex = 0;

  // Daftar halaman yang akan ditampilkan sesuai tab yang dipilih
  final List<Widget> _pages = [
    const Center(child: HomePage()),
    const Center(child: Text('History')),
    const Center(child: RecentCallsPage()),
    const Center(child: SettingsPage()),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          _pages[_currentIndex], // Menampilkan halaman sesuai tab yang dipilih
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent, // Hilangkan efek ripple
          highlightColor: Colors.transparent, // Hilangkan efek highlight
          hoverColor: Colors.transparent, // Hilangkan efek hover
          focusColor: Colors.transparent, // Hilangkan efek focus
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05), // Warna shadow
                spreadRadius: 20, // Radius penyebaran
                blurRadius: 20, // Tingkat keburaman shadow
                offset: const Offset(0, -2), // Posisi shadow (x, y)
              ),
            ],
          ),
          child: BottomNavigationBar(
            // elevation: 8.0,
            selectedFontSize: 0,
            currentIndex: _currentIndex, // Index saat ini
            onTap: _onTabTapped, // Mengubah halaman saat tab ditekan
            type: BottomNavigationBarType.fixed,
            items: [
              _buildNavItem('chat', 0),
              _buildNavItem('time', 1),
              _buildNavItem('call', 2),
              _buildNavItem('profile', 3),
            ],
            selectedItemColor:
                Theme.of(context).primaryColor, // Warna item yang dipilih
            unselectedItemColor: Colors.grey, // Warna item yang tidak dipilih
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(String icon, int index) {
    bool isActive = _currentIndex == index;

    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: AppSvgIcon(
          icon,
          color:
              isActive ? Pallete.blue1 : Pallete.textSecondary.withOpacity(0.5),
        ),
      ),
      label: '',
    );
  }
}
