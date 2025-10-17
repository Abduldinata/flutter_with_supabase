import 'package:flutter/material.dart';
import 'package:myapp/profil_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0), // jarak tepi layar
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // TextField Username
              TextField(
                controller: usernameController,
                decoration: const InputDecoration(
                  labelText: 'Username',
                  hintText: 'Masukkan username',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 20), // jarak antar input

              // TextField Password
              const TextField(
                obscureText: true, // sembunyikan password
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Masukkan password',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 30), // jarak sebelum tombol

              // Tombol Login
              SizedBox(
                width: double.infinity, // tombol selebar layar
                height: 50, // tinggi tombol
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => ProfilScreen(
                          username: usernameController.text,
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  child: const Text(
                    "Login", // teks tombol lebih panjang
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
