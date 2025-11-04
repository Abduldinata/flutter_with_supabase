import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import '../services/session_service.dart';
import 'login_page.dart';
import 'profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _bottomNavIndex = 0;
  final iconList = <IconData>[
    Icons.home,
    Icons.favorite,
    Icons.settings,
    Icons.person,
  ];

  @override
  Widget build(BuildContext context) {
    final u = session.user ?? {};
    final name = (u['name'] ?? 'Pengguna').toString();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            tooltip: 'Profil',
            icon: const Icon(Icons.person),
            onPressed: () {
              Get.to(() => const ProfilePage());
            },
          ),
          IconButton(
            tooltip: 'Logout',
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await session.logout();
              Get.snackbar(
                'Logout',
                'Anda telah keluar',
                snackPosition: SnackPosition.TOP,
              );
              Get.to(() => const LoginPage());
            },
          ),
        ],
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Halo, $name!', style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Simpan'),
            ),
            ElevatedButton(
              onPressed: () {
                String hasil = '';
                print(hasil);
              },
              child: const Text('Tampilkan di terminal'),
            ),
          ],
        ),
      ),

      bottomNavigationBar: AnimatedBottomNavigationBar(
      icons: iconList,
      activeIndex: _bottomNavIndex,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.verySmoothEdge,
      leftCornerRadius: 32,
      rightCornerRadius: 32,
      onTap: (index) => setState(() => _bottomNavIndex = index),
      //other params
   ),
);
  }
}
