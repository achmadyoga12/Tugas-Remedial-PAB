import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final namaC = TextEditingController();
  final emailC = TextEditingController();
  final passwordC = TextEditingController();

  Future register() async {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
          email: emailC.text,
          password: passwordC.text,
        );

    await FirebaseFirestore.instance
        .collection("users")
        .doc(userCredential.user!.uid)
        .set({
          "nama": namaC.text,
          "email": emailC.text,
          "instagram": "@spacenews",
          "photo": "https://i.pravatar.cc/300",
        });

    if (!mounted) return;

    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Daftar")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Image.asset("assets/logo.png", height: 120),

            TextField(
              controller: namaC,
              decoration: const InputDecoration(labelText: "Nama"),
            ),

            TextField(
              controller: emailC,
              decoration: const InputDecoration(labelText: "Email"),
            ),

            TextField(
              controller: passwordC,
              obscureText: true,
              decoration: const InputDecoration(labelText: "Password"),
            ),

            const SizedBox(height: 20),

            ElevatedButton(onPressed: register, child: const Text("Daftar")),

            TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/login');
              },
              child: const Text("Apakah sudah punya akun? Login"),
            ),
          ],
        ),
      ),
    );
  }
}
