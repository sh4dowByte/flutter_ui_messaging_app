import 'package:flutter/material.dart';
import 'package:flutter_ui_messaging_app/config/pallete.dart';
import 'package:flutter_ui_messaging_app/config/routes.dart';
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
      'unread': 999,
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
      'picture': 'photo-1502323777036-f29e3972d82f',
      'name': 'Samuel Witnessa',
      'message': 'I’d like to watch ... ',
      'time': '18.31',
      'unread': 10,
      'is_reply': true,
      'status': 'online'
    },
    {
      'picture': 'photo-1517702145080-e4a4d91435bb',
      'name': 'Bambang Wijayanto',
      'message': 'I’d like to watch ... ',
      'time': '18.31',
      'unread': 0,
      'is_reply': true,
      'status': 'online'
    },
    {
      'picture': 'photo-1521132293557-5b908a59d1e1',
      'name': 'Sururi Mandatson',
      'message': 'I’d like to watch ... ',
      'time': '18.31',
      'unread': 0,
      'is_reply': true,
      'status': 'online'
    },
    {
      'picture': 'photo-1522091759069-9fe8e6826b7f',
      'name': 'Michael Robbin',
      'message': 'I’d like to watch ... ',
      'time': '18.31',
      'unread': 0,
      'is_reply': true,
      'status': 'online'
    },
    {
      'picture': 'photo-1517777557049-0f1f4537b849',
      'name': 'Jackobs Stewart',
      'message': 'I’d like to watch ... ',
      'time': '18.31',
      'unread': 0,
      'is_reply': true,
      'status': 'bussy'
    },
    {
      'picture': 'photo-1526382925646-27b5eb86796e',
      'name': 'Anastasia Redborn',
      'message': 'I’d like to watch ... ',
      'time': '18.31',
      'unread': 0,
      'is_reply': true,
      'status': 'offline'
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
    final double minHeightInPixels = MediaQuery.of(context).size.height - 390.0;
    final double initialHeightInPixels =
        MediaQuery.of(context).size.height - 390.0;

    // Hitung tinggi dalam persentase
    final double minChildSize =
        minHeightInPixels / MediaQuery.of(context).size.height;
    final double initialChildSize =
        initialHeightInPixels / MediaQuery.of(context).size.height;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(16),
              ),
            ),
            builder: (BuildContext context) {
              return const CategorySheet();
            },
          );
        },
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
                          onTap: () =>
                              Navigator.pushNamed(context, Routes.groupChats),
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
                        surfaceTintColor: Colors.transparent,
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
                                      onTap: () => Navigator.pushNamed(
                                          context, Routes.groupChats),
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

class CategorySheet extends StatelessWidget {
  const CategorySheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            decoration: BoxDecoration(
              color: Pallete.textSecondary.withOpacity(0.2),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            height: 4,
            width: 24,
            margin: const EdgeInsets.symmetric(vertical: 10),
          ),
        ),
        const SizedBox(height: 12),
        Expanded(
          child: ListView(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Create a new category',
                      style: TextStyle(
                          color: Pallete.textPrimary,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          flex: 7,
                          child: TextFormField(
                            style: const TextStyle(
                              fontSize: 14, // Mengatur ukuran font
                            ),
                            initialValue: "Workmates",
                            decoration: InputDecoration(
                              // labelText: 'Enter new category',
                              hintText: 'Enter new category',
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors
                                      .grey, // Warna garis bawah saat tidak fokus
                                  width: 1.0, // Ketebalan garis bawah
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Pallete
                                      .blue1, // Warna garis bawah saat fokus
                                  width: 2.0, // Ketebalan garis bawah
                                ),
                              ),
                            ),
                            onChanged: (text) {},
                          ),
                        ),
                        // ignore: prefer_const_constructors
                        SizedBox(width: 17),
                        Expanded(
                          flex: 2,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            height: 35,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: Pallete.blue1),
                            child: const Center(
                              child: Text(
                                'Create',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 34),

                    // Sugested category
                    Text(
                      'Suggested category',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Pallete.textSecondary,
                      ),
                    ),
                    const SizedBox(height: 12),
                    suggestedCategory(
                        title: 'Class',
                        subtitle: 'Biology-1, Mathematics-1A, and 3 others',
                        caption: 'Based on group’s name'),
                    suggestedCategory(
                        title: 'Organizations',
                        subtitle:
                            'Flyway 2020, Flyway Internal Division, and 2 others',
                        caption: 'Based on similiar name and date creations'),

                    const SizedBox(height: 12),

                    // Included Chats
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Included chats (3)',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Pallete.textSecondary,
                          ),
                        ),
                        Text(
                          '+ Add chats',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Pallete.blue1,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    includedChats(
                        picture: 'photo-1500648767791-00dcc994a43e',
                        status: 'bussy',
                        name: 'Darlene Steward'),
                    includedChats(
                        picture: 'photo-1517777557049-0f1f4537b849',
                        status: 'bussy',
                        name: 'Billie Anderson'),
                    includedChats(
                        picture: 'photo-1526382925646-27b5eb86796e',
                        status: 'bussy',
                        name: 'Ahmed Boustani'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget includedChats(
      {required String picture, required String name, required String status}) {
    return Container(
      padding: const EdgeInsets.only(bottom: 24),
      child: Row(
        children: [
          AppProfileIcon(
            picture: picture,
            status: status,
          ),
          const SizedBox(width: 16),
          Text(name),
        ],
      ),
    );
  }

  Widget suggestedCategory(
      {required String title,
      required String subtitle,
      required String caption}) {
    return Container(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            caption,
            style: TextStyle(fontSize: 12, color: Pallete.textSecondary),
          ),
        ],
      ),
    );
  }
}
