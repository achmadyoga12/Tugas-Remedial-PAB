import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final emailC = TextEditingController();

  Future sendEmail() async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: emailC.text);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Link reset password berhasil dikirim")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Forgot Password")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: emailC,
              decoration: const InputDecoration(labelText: "Email"),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: sendEmail,
              child: const Text("Send to email"),
            ),
          ],
        ),
      ),
    );
  }
}
