import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  FavoritePage({super.key});

  String uid = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Favorite News")),

      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("users")
            .doc(uid)
            .collection("favorites")
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final data = snapshot.data!.docs;

          if (data.isEmpty) {
            return const Center(child: Text("Belum ada favorite"));
          }

          return ListView.builder(
            itemCount: data.length,

            itemBuilder: (context, index) {
              final item = data[index];

              return Card(
                child: ListTile(
                  leading: Image.network(
                    item["image"],
                    width: 80,
                    fit: BoxFit.cover,
                  ),

                  title: Text(item["title"]),

                  subtitle: Text(item["site"]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
