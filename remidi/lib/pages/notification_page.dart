import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final notifications = [
      {"title": "New NASA Mission Update", "time": "1 menit yang lalu"},
      {"title": "SpaceX Launch Success", "time": "10 menit yang lalu"},
      {"title": "New Mars Discovery", "time": "30 menit yang lalu"},
      {"title": "International Space Station News", "time": "1 jam yang lalu"},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Notifications")),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const CircleAvatar(child: Icon(Icons.notifications)),
            title: Text(notifications[index]["title"]!),
            subtitle: Text(notifications[index]["time"]!),
          );
        },
      ),
    );
  }
}
