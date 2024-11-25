import 'package:flutter/material.dart';

import '../config/pallete.dart';
import 'app_chat_tile.dart';
import 'app_svg_icon.dart';

class AppCallsTile extends StatelessWidget {
  final String picture;
  final String name;
  final List<Map<String, dynamic>> history;
  final String? status;

  const AppCallsTile({
    super.key,
    required this.picture,
    required this.name,
    required this.history,
    this.status = 'offline',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 64,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  AppProfileIcon(
                    picture: picture,
                    status: status,
                    size: 48,
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          AppSvgIcon(
                            history[0]['incoming'] ? 'incoming' : 'outcoming',
                            color: history[0]['is_reject']
                                ? Pallete.red
                                : Pallete.green,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            history[0]['date'],
                            style: const TextStyle(
                                fontWeight: FontWeight.w100, fontSize: 12),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              AppSvgIcon(
                history[0]['type'] == 'call' ? 'calls' : 'video',
                color: Pallete.blue1,
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
