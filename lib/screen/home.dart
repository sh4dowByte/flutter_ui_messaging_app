import 'package:flutter/material.dart';
import 'package:flutter_ui_messaging_app/config/pallete.dart';
import 'package:flutter_ui_messaging_app/utils/unplash.dart';
import 'package:flutter_ui_messaging_app/widget/app_chat_tile.dart';
import 'package:flutter_ui_messaging_app/widget/app_svg_icon.dart';

import '../widget/app_select_item_small.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final DraggableScrollableController sheetController =
      DraggableScrollableController();

  List<Map<String, dynamic>> pinnedChats = [
    {
      'picture': 'photo-1494790108377-be9c29b29330',
      'name': 'Mike Wazowski',
      'message': 'That’s awesome!',
      'unread': 0,
      'is_reply': true,
      'status': 'offline'
    },
    {
      'picture': 'photo-1500648767791-00dcc994a43e',
      'name': 'Darlene Steward',
      'message': 'Pls take a look at the...',
      'unread': 5,
      'is_reply': false,
      'status': 'offline'
    },
    {
      'picture': 'photo-1438761681033-6461ffad8d80',
      'name': 'Gregory Robertson',
      'message': 'Preparing for next vac...',
      'unread': 0,
      'is_reply': false,
      'status': 'disabled'
    },
    {
      'picture': 'photo-1506863530036-1efeddceb993',
      'name': 'Dwight Wilson',
      'message': 'I’d like to watch ... ',
      'unread': 0,
      'is_reply': true,
      'status': 'online'
    },
  ];

  List<Map<String, dynamic>> recentChats = [
    {
      'picture': 'photo-1500648767791-00dcc994a43e',
      'name': 'Darlene Steward',
      'message': 'Pls take a look at the...',
      'time': '18.31',
      'unread': 5,
      'is_reply': false,
      'status': 'offline'
    },
    {
      'picture': 'photo-1494790108377-be9c29b29330',
      'name': 'Fullsnack Designers',
      'message': 'Hello guys, we have discussed about ...',
      'time': '18.31',
      'unread': 0,
      'is_reply': true,
      'status': 'offline'
    },
    {
      'picture': 'photo-1583243552802-94ccb4200150',
      'name': 'Lee Williamson',
      'message': 'Yes, that’s gonna work, hopefully. ',
      'time': '18.31',
      'unread': 0,
      'is_reply': true,
      'status': 'offline'
    },
    {
      'picture': 'photo-1438761681033-6461ffad8d80',
      'name': 'Gregory Robertson',
      'message': 'Preparing for next vac...',
      'time': '18.31',
      'unread': 0,
      'is_reply': false,
      'status': 'disabled'
    },
    {
      'picture': 'photo-1506863530036-1efeddceb993',
      'name': 'Dwight Wilson',
      'message': 'I’d like to watch ... ',
      'time': '18.31',
      'unread': 0,
      'is_reply': true,
      'status': 'online'
    },
    {
      'picture': 'photo-1506863530036-1efeddceb993',
      'name': 'Dwight Wilson',
      'message': 'I’d like to watch ... ',
      'time': '18.31',
      'unread': 0,
      'is_reply': true,
      'status': 'online'
    },
    {
      'picture': 'photo-1506863530036-1efeddceb993',
      'name': 'Dwight Wilson',
      'message': 'I’d like to watch ... ',
      'time': '18.31',
      'unread': 0,
      'is_reply': true,
      'status': 'online'
    },
    {
      'picture': 'photo-1506863530036-1efeddceb993',
      'name': 'Dwight Wilson',
      'message': 'I’d like to watch ... ',
      'time': '18.31',
      'unread': 0,
      'is_reply': true,
      'status': 'online'
    },
    {
      'picture': 'photo-1506863530036-1efeddceb993',
      'name': 'Dwight Wilson',
      'message': 'I’d like to watch ... ',
      'time': '18.31',
      'unread': 0,
      'is_reply': true,
      'status': 'online'
    },
    {
      'picture': 'photo-1506863530036-1efeddceb993',
      'name': 'Dwight Wilson',
      'message': 'I’d like to watch ... ',
      'time': '18.31',
      'unread': 0,
      'is_reply': true,
      'status': 'online'
    },
    {
      'picture': 'photo-1506863530036-1efeddceb993',
      'name': 'Dwight Wilson',
      'message': 'I’d like to watch ... ',
      'time': '18.31',
      'unread': 0,
      'is_reply': true,
      'status': 'online'
    },
  ];

  final List<Map<String, dynamic>> category = [
    {'id': 1, 'name': 'All Chats'},
    {'id': 2, 'name': 'Personal'},
    {'id': 3, 'name': 'Work'},
    {'id': 4, 'name': 'Group'},
  ];

  @override
  Widget build(BuildContext context) {
    // Target tinggi dalam piksel
    final double minHeightInPixels = MediaQuery.of(context).size.height - 400.0;
    final double initialHeightInPixels =
        MediaQuery.of(context).size.height - 400.0;

    // Hitung tinggi dalam persentase
    final double minChildSize =
        minHeightInPixels / MediaQuery.of(context).size.height;
    final double initialChildSize =
        initialHeightInPixels / MediaQuery.of(context).size.height;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Pallete.blue1, // Warna latar belakang FAB
        foregroundColor: Colors.white, // Warna ikon
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(30), // FAB dengan sudut melengkung
        ),
        child: const AppSvgIcon('new chat'),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0)
                  .copyWith(top: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Pinned Chats',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(16)),
                        child: UnsplashWidget.getById(
                            'photo-1494790108377-be9c29b29330',
                            width: 24,
                            height: 24),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Expanded(
                    child: GridView.builder(
                      padding: const EdgeInsets.all(0),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Jumlah kolom
                        crossAxisSpacing: 8.0, // Jarak antar kolom
                        mainAxisSpacing: 8.0, // Jarak antar baris
                        childAspectRatio:
                            3 / 2, // Perbandingan ukuran item (lebar/tinggi)
                      ),
                      itemCount: pinnedChats.length,
                      itemBuilder: (context, index) {
                        final e = pinnedChats[index];
                        return AppChatTile(
                          picture: e['picture'],
                          name: e['name'],
                          message: e['message'],
                          isReply: e['is_reply'],
                          status: e['status'],
                          unread: e['unread'],
                          isPinned: true,
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),

            // Recent Chats
            DraggableScrollableSheet(
              controller: sheetController,
              initialChildSize: initialChildSize, // Tinggi awal 30% dari layar
              minChildSize: minChildSize, // Tinggi minimum 20% dari layar
              maxChildSize: 1,
              builder: (BuildContext context, scrollController) {
                return Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05), // Warna shadow
                        spreadRadius: 9, // Radius penyebaran
                        blurRadius: 20, // Tingkat keburaman shadow
                        offset: const Offset(0, -2), // Posisi shadow (x, y)
                      ),
                    ],
                  ),
                  child: CustomScrollView(
                    controller: scrollController,
                    // physics: const ClampingScrollPhysics(),
                    slivers: [
                      SliverToBoxAdapter(
                        child: Center(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Pallete.textSecondary.withOpacity(0.2),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                            ),
                            height: 4,
                            width: 24,
                            margin: const EdgeInsets.symmetric(vertical: 10),
                          ),
                        ),
                      ),
                      const SliverAppBar(
                        title: Text('  Recent Chats'),
                        primary: false,
                        pinned: true,
                        centerTitle: false,
                        actions: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: AppSvgIcon('search'),
                          ),
                        ],
                      ),
                      SliverList.list(children: [
                        AppSelectItemSmall(
                          item: category,
                        ),
                        const SizedBox(height: 24),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            children: [
                              ...recentChats.map(
                                (e) => Column(
                                  children: [
                                    AppChatTile(
                                      picture: e['picture'],
                                      name: e['name'],
                                      message: e['message'],
                                      isReply: e['is_reply'],
                                      status: e['status'],
                                      unread: e['unread'],
                                      time: e['time'],
                                    ),
                                    const SizedBox(height: 12),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ])
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
