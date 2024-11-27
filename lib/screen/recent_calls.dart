import 'package:flutter/material.dart';
import '../widget/widget.dart';

class RecentCallsPage extends StatelessWidget {
  const RecentCallsPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> recentCalls = [
      {
        'picture': 'photo-1494790108377-be9c29b29330',
        'name': 'Darlene Steward',
        'status': 'bussy',
        'history': [
          {
            'date': '33 mins',
            'size': '12.3 MB',
            'type': 'call',
            'incoming': true,
            'is_reject': false
          },
          {
            'date': '33 mins',
            'size': '12.3 MB',
            'type': 'call',
            'incoming': true,
            'is_reject': false
          },
          {
            'date': '33 mins',
            'size': '12.3 MB',
            'type': 'video_call',
            'incoming': false,
            'is_reject': true
          },
          {
            'date': '33 mins',
            'size': '12.3 MB',
            'type': 'call',
            'incoming': true,
            'is_reject': false
          },
          {
            'date': '33 mins',
            'size': '12.3 MB',
            'type': 'call',
            'incoming': false,
            'is_reject': true
          },
        ],
      },
      {
        'picture': 'photo-1494790108377-be9c29b29330',
        'name': 'Lee Williamson',
        'status': 'online',
        'history': [
          {
            'date': 'July 08, 06.30 PM',
            'size': '12.3 MB',
            'type': 'call',
            'incoming': false,
            'is_reject': false
          },
        ],
      },
      {
        'picture': 'photo-1494790108377-be9c29b29330',
        'name': 'Dwight Wilson',
        'status': 'online',
        'history': [
          {
            'date': 'July 08, 4.30 PM',
            'size': '12.3 MB',
            'type': 'video',
            'incoming': true,
            'is_reject': false
          },
        ],
      },
      {
        'picture': 'photo-1494790108377-be9c29b29330',
        'name': 'Albert Bell',
        'status': 'offline',
        'history': [
          {
            'date': 'July 08, 1.30 PM',
            'size': '12.3 MB',
            'type': 'video',
            'incoming': true,
            'is_reject': true
          },
        ],
      },
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Recent Calls'),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: AppSvgIcon(
              'search',
              color: Theme.of(context).primaryColorDark,
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        children: recentCalls
            .map((e) => AppCallsTile(
                picture: e['picture'],
                name: e['name'],
                history: e['history'],
                status: e['status']))
            .toList(),
      ),
    );
  }
}
