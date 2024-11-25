import 'package:flutter/material.dart';

class Routes {
  static const String signUp = '/sign_up';
  static const String signIn = '/sign_in';
  static const String chooseTopic = '/choose_topic';
  static const String reminders = '/reminders';
  static const String menu = '/menu';
  static const String playOption = '/play_option';
  static const String sleepMusic = '/sleep_music';
  static const String welcome = '/welcome';
  static const String music = '/music';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case signUp:
      //   return MaterialPageRoute(builder: (_) => const SignUpPage());

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
