import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            title: Text('Notification Settings'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to Notification Settings page
            },
          ),
          ListTile(
            title: Text('Privacy Settings'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to Privacy Settings page
            },
          ),
          Divider(),
          ListTile(
            title: Text('Log Out'),
            onTap: () {
              // Log out the user
            },
          ),
        ],
      ),
    );
  }
}
