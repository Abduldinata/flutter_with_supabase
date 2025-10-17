import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'edit_profil_screen.dart'; // ✅ tambahkan import ini

class ProfilScreen extends StatefulWidget { // ✅ ubah ke Stateful agar bisa diupdate
  const ProfilScreen({super.key, this.username});

  final String? username;

  @override
  State<ProfilScreen> createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
  // ✅ variabel untuk data profil yang bisa diubah
  String nama = "Hiyosashii";
  String alamat = "Gentan";
  String hobi = "Game";
  String umur = "20";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text("Profil ${widget.username}"),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(16),
          shrinkWrap: true,
          children: [
            Image.asset("asset/icon.jpg", height: 200),
            const SizedBox(height: 16),
            Text(
              nama,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              alamat,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.favorite, color: Colors.red),
                Icon(Icons.favorite, color: Colors.red),
                Icon(Icons.favorite, color: Colors.red),
              ],
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Alamat"),
              subtitle: Text(alamat),
              trailing: const Icon(Icons.arrow_circle_right),
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(Icons.sports_esports),
              title: const Text("Hobi"),
              subtitle: Text(hobi),
              trailing: const Icon(Icons.arrow_circle_right),
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(Icons.cake),
              title: const Text("Umur"),
              subtitle: Text(umur),
              trailing: const Icon(Icons.arrow_circle_right),
            ),
            const SizedBox(height: 20),

            // ✅ Tambahkan tombol Edit Profil
            ElevatedButton(
              onPressed: () async {
                // Panggil halaman edit dan tunggu hasil
                final updatedData = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditProfilScreen(
                      nama: nama,
                      alamat: alamat,
                      hobi: hobi,
                      umur: umur,
                    ),
                  ),
                );

                // Jika ada data yang diupdate
                if (updatedData != null) {
                  setState(() {
                    nama = updatedData['nama'];
                    alamat = updatedData['alamat'];
                    hobi = updatedData['hobi'];
                    umur = updatedData['umur'];
                  });
                }
              },
              child: const Text('Edit Profil'), // ✅ tombol baru
            ),

            const SizedBox(height: 16),

            // Tombol Kembali (sudah ada)
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
