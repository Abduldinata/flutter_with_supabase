import 'package:flutter/material.dart';

class EditProfilScreen extends StatefulWidget {
  final String nama;
  final String alamat;
  final String hobi;
  final String umur;

  const EditProfilScreen({
    super.key,
    required this.nama,
    required this.alamat,
    required this.hobi,
    required this.umur,
  });

  @override
  State<EditProfilScreen> createState() => _EditProfilScreenState();
}

class _EditProfilScreenState extends State<EditProfilScreen> {
  late TextEditingController namaController;
  late TextEditingController alamatController;
  late TextEditingController hobiController;
  late TextEditingController umurController;

  @override
  void initState() {
    super.initState();
    namaController = TextEditingController(text: widget.nama);
    alamatController = TextEditingController(text: widget.alamat);
    hobiController = TextEditingController(text: widget.hobi);
    umurController = TextEditingController(text: widget.umur);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Profil")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            TextField(
              controller: namaController,
              decoration: const InputDecoration(
                labelText: "Nama",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: alamatController,
              decoration: const InputDecoration(
                labelText: "Alamat",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: hobiController,
              decoration: const InputDecoration(
                labelText: "Hobi",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: umurController,
              decoration: const InputDecoration(
                labelText: "Umur",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, {
                  'nama': namaController.text,
                  'alamat': alamatController.text,
                  'hobi': hobiController.text,
                  'umur': umurController.text,
                });
              },
              child: const Text("Simpan"),
            ),
          ],
        ),
      ),
    );
  }
}
