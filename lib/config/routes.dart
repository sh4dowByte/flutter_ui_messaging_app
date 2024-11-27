import 'package:flutter/material.dart';
import 'package:flutter_ui_messaging_app/screen/screen.dart';

class Routes {
  static const String groupChats = '/group_chats';
  static const String groupDescription = '/group_description';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case groupChats:
        return MaterialPageRoute(builder: (_) => const GroupChatsPage());

      case groupDescription:
        return MaterialPageRoute(builder: (_) => const GroupDescriptionPage());

      case '/':
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  appBar: AppBar(
                    title: const Text('Routes'),
                    centerTitle: true, // Judul di tengah
                  ),
                  body: const Center(
                    child: Text('Routes Not Found'),
                  ),
                ));
    }
  }
}
