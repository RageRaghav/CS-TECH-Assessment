
import 'package:flutter/material.dart';

class CustomSidebar extends StatelessWidget {
  final String email;
  final String username;
  const CustomSidebar({
    Key? key,
    required this.email,
    required this.username,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.75,
      child: Drawer(
        backgroundColor: const Color(0xFFF8FAFC),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(height: 40,color: const Color(0xFF2563EB),),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              color: const Color(0xFF2563EB),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 28,
                    backgroundImage: AssetImage('assets/profile.png'),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      Text(
                        '$username',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      Text(
                        'Personal',
                        style: TextStyle(
                          color: Colors.yellowAccent,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        '$email',
                        style: TextStyle(
                          color: Color(0xFFCBD5E1),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            _buildListTile(Icons.grid_view_rounded, 'Getting Started'),
            _buildListTile(Icons.sync, 'Sync Data'),
            _buildListTile(Icons.videogame_asset_outlined, 'Gamification'),
            _buildListTile(Icons.mic_none, 'Send Logs'),
            _buildListTile(Icons.settings, 'Settings'),
            _buildListTile(Icons.help_outline, 'Help?'),
            _buildListTile(Icons.cancel_outlined, 'Cancel Subscription'),

            const Divider(thickness: 1),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: Text(
                "App Info",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.blue,
                ),
              ),
            ),
            _buildListTile(Icons.info_outline, 'About Us'),
            _buildListTile(Icons.privacy_tip_outlined, 'Privacy Policy'),
            _buildListTile(Icons.system_update_alt, 'Version 1.01.52'),
            _buildListTile(Icons.share, 'Share App'),
            _buildListTile(Icons.logout, 'Logout'),
          ],
        ),
      ),
    );
  }

  ListTile _buildListTile(IconData icon, String title) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 18,
        child: Icon(icon, color: Colors.black, size: 18),
      ),
      title: Text(
        title,
        style: const TextStyle(fontSize: 14, color: Colors.black),
      ),
      onTap: () {},
    );
  }
}
