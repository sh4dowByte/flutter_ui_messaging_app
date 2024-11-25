import 'package:flutter/material.dart';
import 'package:flutter_ui_messaging_app/config/pallete.dart';
import 'package:flutter_ui_messaging_app/utils/unplash.dart';
import '../widget/widget.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Settings'),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: AppSvgIcon('search'),
          ),
        ],
      ),
      body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(64)),
                  child: UnsplashWidget.getById(
                      'photo-1494790108377-be9c29b29330',
                      width: 64,
                      height: 64),
                ),
                const SizedBox(width: 24),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Adina Nurrahma',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Trust your feelings , be a good human beings',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w100,
                            color: Pallete.textSecondary),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Divider(),
            AppMenuTile(
              title: 'Dark Mode',
              icon: 'theme',
              leading: Switch(
                value: isSwitched,
                onChanged: (value) {
                  setState(() {
                    isSwitched = value;
                  });
                },
              ),
            ),
            const AppMenuTile(title: 'Account', icon: 'account'),
            const AppMenuTile(title: 'Notification', icon: 'notification2'),
            const AppMenuTile(title: 'Chat Settings', icon: 'chat'),
            const AppMenuTile(title: 'Data and Storage', icon: 'chart'),
            const AppMenuTile(title: 'Privacy and Security', icon: 'lock'),
            const AppMenuTile(title: 'About', icon: 'info2'),
          ]),
    );
  }
}

class AppMenuTile extends StatelessWidget {
  final Widget? leading;
  final String title;
  final String icon;
  const AppMenuTile({
    super.key,
    this.leading,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              AppSvgIcon(icon, color: Pallete.blue1),
              const SizedBox(width: 16),
              Text(title),
            ],
          ),
          leading ??
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: Pallete.textSecondary.withOpacity(0.4),
                size: 16,
              )
        ],
      ),
    );
  }
}
