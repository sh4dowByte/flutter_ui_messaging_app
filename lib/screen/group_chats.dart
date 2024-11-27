import 'package:flutter/material.dart';
import '../config/pallete.dart';
import '../config/routes.dart';
import '../utils/unplash.dart';
import '../widget/widget.dart';

class GroupChatsPage extends StatefulWidget {
  const GroupChatsPage({super.key});

  @override
  State<GroupChatsPage> createState() => _GroupChatsPageState();
}

class _GroupChatsPageState extends State<GroupChatsPage> {
  final ScrollController _scrollController =
      ScrollController(); // Controller untuk ListView

  @override
  void dispose() {
    _scrollController
        .dispose(); // Jangan lupa dispose controller untuk mencegah kebocoran memori
    super.dispose();
  }

  void _scrollToEnd() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent, // Posisi akhir
      duration: const Duration(milliseconds: 500), // Durasi animasi
      curve: Curves.easeInOut, // Kurva animasi
    );
  }

  @override
  void initState() {
    super.initState();
    // Trigger scroll to end setelah widget selesai dibangun
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToEnd();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: GestureDetector(
          onTap: () => Navigator.pushNamed(context, Routes.groupDescription),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(48)),
                child: UnsplashWidget.getById(
                    'photo-1494790108377-be9c29b29330',
                    width: 48,
                    height: 48),
              ),
              const SizedBox(width: 10),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Fullsnack Designers',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 3),
                    Text(
                      '7 Online, from 12 peoples',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: AppSvgIcon('video'),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Icon(Icons.more_vert_rounded),
          ),
        ],
      ),
      body: Stack(
        children: [
          ListView(
            controller: _scrollController,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16)
                .copyWith(top: 10, bottom: 130),
            children: const [
              // LEFT
              AppContentChat(isLeft: true),
              AppContentChat(isLeft: false),
              AppContentChat(isLeft: true),
              AppContentChat(isLeft: true),

              // RIGHT
              AppContentChat(isLeft: false),
            ],
          ),
          const Positioned(
              bottom: 0, left: 0, right: 0, child: AppInputMessage())
        ],
      ),
    );
  }
}

class AppInputMessage extends StatefulWidget {
  const AppInputMessage({super.key});

  @override
  State<AppInputMessage> createState() => _AppInputMessageState();
}

class _AppInputMessageState extends State<AppInputMessage>
    with SingleTickerProviderStateMixin {
  bool _isVisible = false;
  String channel = '#General';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05), // Warna shadow
            spreadRadius: 20, // Radius penyebaran
            blurRadius: 20, // Tingkat keburaman shadow
            offset: const Offset(0, -2), // Posisi shadow (x, y)
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                !_isVisible
                    ? GestureDetector(
                        onTap: () {
                          setState(() {
                            _isVisible = !_isVisible;
                          });
                        },
                        child: Text(
                          channel,
                          style: TextStyle(
                            color: Pallete.blue1,
                          ),
                        ),
                      )
                    : const Text(
                        'Channels',
                        style: TextStyle(),
                      ),
                SizedBox(
                  height: 42,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isVisible = !_isVisible;
                          });
                        },
                        child: !_isVisible
                            ? Icon(
                                Icons.keyboard_arrow_up_outlined,
                                color: Pallete.blue1,
                              )
                            : Icon(
                                Icons.keyboard_arrow_down_outlined,
                                color: Pallete.blue1,
                              ),
                      ),
                      const SizedBox(width: 24),
                      Icon(
                        Icons.more_vert_rounded,
                        color: Pallete.blue1,
                      )
                    ],
                  ),
                )
              ],
            ),
            Visibility(
              visible: _isVisible,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextChannels('# General', onTap: (p0) {
                    setState(() {
                      channel = p0;
                      _isVisible = false;
                    });
                  }),
                  TextChannels('# Design Team', onTap: (p0) {
                    setState(() {
                      channel = p0;
                      _isVisible = false;
                    });
                  }),
                  TextChannels('# UX Writer', onTap: (p0) {
                    setState(() {
                      channel = p0;
                      _isVisible = false;
                    });
                  }),
                  TextChannels('# Projects', onTap: (p0) {
                    setState(() {
                      channel = p0;
                      _isVisible = false;
                    });
                  }),
                ],
              ),
            ),
            const Divider(),

            // Input
            Row(
              children: [
                const AppSvgIcon('emoji'),
                const Expanded(
                  child: TextField(
                    style: TextStyle(
                      fontSize: 12, // Ukuran teks yang dimasukkan
                    ),
                    decoration: InputDecoration(
                      hintText: "Write a message...",
                      border: InputBorder.none, // No border

                      contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                const AppSvgIcon('lampiran'),
                const SizedBox(width: 16.0),
                Container(
                  padding: const EdgeInsets.all(8),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Pallete.blue1,
                      borderRadius: BorderRadius.circular(40)),
                  child: const AppSvgIcon(
                    'voice',
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TextChannels extends StatelessWidget {
  final String channel;
  final Function(String)? onTap;
  const TextChannels(
    this.channel, {
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: () {
          if (onTap != null) {
            onTap!(channel);
          }
        },
        child: Text(
          channel,
          style: TextStyle(
            color: Pallete.blue1,
          ),
        ),
      ),
    );
  }
}

class AppContentChat extends StatelessWidget {
  final bool isLeft;
  const AppContentChat({
    super.key,
    required this.isLeft,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!isLeft) ...[
            const SizedBox(width: 49),
            // Content message
            AppMessageContent(
              isLeft: isLeft,
            ),
            const SizedBox(
              width: 10,
            ),
            // Profile picture
            const AppProfileIcon(
              picture: 'photo-1494790108377-be9c29b29330',
              status: 'online',
              size: 40,
            ),
          ] else ...[
            // Profile picture
            const AppProfileIcon(
              picture: 'photo-1494790108377-be9c29b29330',
              status: 'online',
              size: 40,
            ),
            const SizedBox(
              width: 10,
            ),
            // Content message
            const AppMessageContent(),
            const SizedBox(width: 49),
          ]
        ],
      ),
    );
  }
}

class AppMessageContent extends StatelessWidget {
  final bool? isLeft;
  const AppMessageContent({
    super.key,
    this.isLeft = true,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment:
            isLeft == true ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: [
          // Chat buuble
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: isLeft == true
                  ? const Color(0xFFF7F7F7)
                  : const Color(0xFF2F80ED),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Chat header
                if (isLeft == true) ...[
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Mike Mazowski',
                        style: TextStyle(
                          color: Color(0xFFF2994A),
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        'admin',
                        style: TextStyle(
                          color: Color(0xFFA1A1BC),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
                // Message
                Text(
                  'Hello guys, we have discussed about post-corona vacation plan and our decision is to go to Bali. We will have a very big party after this corona ends! These are some images about our destination',
                  style: TextStyle(
                    color: isLeft == true
                        ? const Color(0xFF000000)
                        : const Color(0xFFFFFFFF),
                    fontSize: 12,
                  ),
                ),
                Text(
                  '16.04',
                  style: TextStyle(
                    color: isLeft == true
                        ? const Color(0xFFA1A1BC)
                        : const Color(0xFFFFFFFF),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          // Media
          const SizedBox(
            width: 204,
            child: ThreeInOneSquare(
              imageUrls: [
                'photo-1658767309666-7059226e6de0',
                'photo-1714746041059-eea019f20570',
                'photo-1630440172123-f939afdab7e8',
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ThreeInOneSquare extends StatelessWidget {
  final List<String> imageUrls;

  const ThreeInOneSquare({super.key, required this.imageUrls});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1, // Membuat container berbentuk persegi
      child: Column(
        children: [
          // Gambar atas (1 gambar)
          if (imageUrls.isNotEmpty)
            Expanded(
              flex: 2, // Mengatur proporsi ukuran
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                child: UnsplashWidget.getById(
                  imageUrls[0],
                  fit: BoxFit.cover,
                ),
              ),
            ),
          const SizedBox(height: 4), // Jarak antar gambar

          // Gambar bawah (2 gambar)
          if (imageUrls.length > 1)
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  // Gambar pertama di bawah
                  Expanded(
                      child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                    child: UnsplashWidget.getById(
                      imageUrls.length > 1 ? imageUrls[1] : '',
                      fit: BoxFit.cover,
                    ),
                  )),
                  const SizedBox(width: 4), // Jarak antar gambar
                  // Gambar kedua di bawah
                  Expanded(
                      child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                    child: UnsplashWidget.getById(
                      imageUrls.length > 2 ? imageUrls[2] : '',
                      fit: BoxFit.cover,
                    ),
                  )),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
