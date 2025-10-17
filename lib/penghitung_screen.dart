import 'package:flutter/material.dart';
import 'package:myapp/home_screen.dart';

class PenghitungScreen extends StatefulWidget {
  const PenghitungScreen({super.key});

  @override
  State<PenghitungScreen> createState() => _PenghitungScreenState();
}

class _PenghitungScreenState extends State<PenghitungScreen> {
  int nilai = 0;

  menghitung() {
    setState(() {});
    nilai = nilai + 1;
    print("ini nilai = $nilai");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: const Text("Penghitung"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Hitung $nilai"),
            ElevatedButton(
              onPressed: () {
                menghitung();
              },
              child: Text("Hitung"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
              child: const Text('Kembali ke Home Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
