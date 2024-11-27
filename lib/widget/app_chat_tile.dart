import 'package:flutter/material.dart';
import 'package:flutter_ui_messaging_app/utils/unplash.dart';

import '../config/pallete.dart';
import 'app_svg_icon.dart';

class AppChatTile extends StatelessWidget {
  final String picture;
  final String name;
  final String message;
  final String? time;
  final int unread;
  final bool? isReply;
  final bool? isPinned;
  final String? status;
  final Function()? onTap;

  const AppChatTile({
    super.key,
    required this.picture,
    required this.name,
    required this.message,
    this.unread = 0,
    this.isReply = false,
    this.status = 'online',
    this.isPinned = false,
    this.time,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    if (!isPinned!) {
      return GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              AppProfileIcon(picture: picture, status: status, size: 48),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name),
                    Text(
                      message,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(color: Pallete.textSecondary),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 40,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(time ?? ''),
                    const SizedBox(height: 2),
                    Visibility(
                      visible: unread != 0,
                      child: Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          color: Pallete.blue1,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.white),
                        ),
                        child: Center(
                          child: Text((unread < 99) ? '$unread' : '99+',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 12)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 102,
        decoration: BoxDecoration(
          color: unread == 0
              ? const Color(0xFFF7F7F7)
              : const Color(0xFF2F80ED).withOpacity(0.1),
          // color: Colors.red,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    children: [
                      AppProfileIcon(picture: picture, status: status),
                      const SizedBox(width: 9),
                      Expanded(
                        child: Text(name),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      if (isReply!) ...[
                        const AppSvgIcon('share'),
                        const SizedBox(width: 9),
                      ],
                      Expanded(
                        child: Text(
                          message,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(color: Pallete.textSecondary),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Notif
            Visibility(
              visible: unread != 0,
              child: Positioned(
                right: 8,
                top: 8,
                child: Container(
                  height: 12,
                  width: 12,
                  decoration: BoxDecoration(
                    color: const Color(0xFF2F80ED),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppProfileIcon extends StatelessWidget {
  const AppProfileIcon({
    super.key,
    required this.picture,
    required this.status,
    this.size = 36,
  });

  final String picture;
  final int size;
  final String? status;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(size.toDouble())),
          child: UnsplashWidget.getById(picture,
              width: size.toDouble(), height: size.toDouble()),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            height: 12,
            width: 12,
            decoration: BoxDecoration(
                color: status == 'online'
                    ? const Color(0xFF4CE417)
                    : status == 'bussy'
                        ? const Color(0xFFF2C94C)
                        : const Color(0xFFBDBDBD),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.white)),
          ),
        ),
      ],
    );
  }
}
