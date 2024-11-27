import 'package:flutter/material.dart';
import 'package:flutter_ui_messaging_app/config/pallete.dart';
import 'package:flutter_ui_messaging_app/widget/widget.dart';

class GroupDescriptionPage extends StatefulWidget {
  const GroupDescriptionPage({super.key});

  @override
  State<GroupDescriptionPage> createState() => _GroupDescriptionPageState();
}

class _GroupDescriptionPageState extends State<GroupDescriptionPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool isSwitched = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      setState(() {}); // Memanggil ulang build setiap kali tab berubah
    });
  }

  @override
  void dispose() {
    _tabController
        .removeListener(() {}); // Menghapus listener saat widget dihancurkan
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xFFFCFCFC),
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                // backgroundColor: const Color(0xFFFFFFFF),
                title: const Text(
                  'Fullsnack Designers',
                  style: TextStyle(fontSize: 18),
                ),
                actions: const [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Icon(Icons.more_vert_rounded),
                  ),
                ],
                expandedHeight: 250.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 40),
                        child: Column(
                          children: [
                            const SizedBox(height: 50),
                            const Row(
                              children: [
                                Icon(Icons.info_outline_rounded),
                                SizedBox(width: 16),
                                Flexible(
                                  child: Text(
                                    'We are fullsnack designers, yes. From food, for food, by food!',
                                    overflow: TextOverflow.fade,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 32),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Row(
                                    children: [
                                      AppSvgIcon(
                                        'notification',
                                        color:
                                            Theme.of(context).iconTheme.color,
                                      ),
                                      const SizedBox(width: 16),
                                      const Text(
                                        'Notifications',
                                        overflow: TextOverflow.fade,
                                      ),
                                    ],
                                  ),
                                ),
                                Switch(
                                  value: isSwitched,
                                  onChanged: (value) {
                                    setState(() {
                                      isSwitched = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // Image.network(
                      //   'https://via.placeholder.com/350x150',
                      //   fit: BoxFit.cover,
                      // ),
                      // Container(
                      //   alignment: Alignment.center,
                      //   color: Colors.white.withOpacity(0.5),
                      //   child: const Text(
                      //     'Header Content',
                      //     style: TextStyle(
                      //       color: Colors.white,
                      //       fontSize: 24.0,
                      //       fontWeight: FontWeight.bold,
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(48.0),
                  child: Column(
                    children: [
                      Divider(
                        thickness: 1,
                        height: 0,
                        color: Theme.of(context).dividerColor,
                      ),
                      Container(
                        alignment:
                            Alignment.centerLeft, // Menempelkan TabBar ke kiri
                        // color: const Color(0xFFFCFCFC), // Warna background TabBar
                        child: TabBar(
                          tabAlignment: TabAlignment.start,
                          dividerHeight: 0,
                          isScrollable: true,
                          controller: _tabController,
                          indicatorColor: Pallete.blue1,

                          indicator: UnderlineTabIndicator(
                            borderSide: BorderSide(
                              color: Pallete.blue1, // Warna indikator
                              width: 4.0, // Ketebalan indikator
                            ),
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(
                                  6.0), // Radius atas pada indikator
                            ),

                            insets: const EdgeInsets.symmetric(
                                horizontal: 30.0), // Lebar indikator
                          ),
                          indicatorSize: TabBarIndicatorSize
                              .label, // Sesuaikan dengan label
                          labelColor:
                              Colors.black, // Warna teks tab yang dipilih
                          unselectedLabelColor:
                              Colors.grey, // Warna teks tab yang tidak dipilih
                          tabs: [
                            _buildCustomTab(0, "stars", "Bookmarks"),
                            _buildCustomTab(1, "image", "Images"),
                            _buildCustomTab(2, "video", "Videos"),
                            _buildCustomTab(3, "document", "Documents"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            controller: _tabController,
            children: const [
              TabBookmarks(),
              Center(child: Text('Content for Tab Images')),
              Center(child: Text('Content for Tab Videos')),
              Center(child: Text('Content for Tab Documents')),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCustomTab(int index, String iconName, String text) {
    bool isActive = _tabController.index == index;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppSvgIcon(
            iconName,
            color: isActive ? Colors.blue : Colors.grey,
          ), // Ganti dengan ikon Anda
          // Warna dinamis
          const SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(
                color: isActive ? Colors.blue : Colors.grey,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class TabBookmarks extends StatelessWidget {
  const TabBookmarks({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> peoplesData = [
      {
        'image': 'photo-1494790108377-be9c29b29330',
        'name': 'Adina Nurrahma',
        'is_me': true,
      },
      {
        'image': 'photo-1522075469751-3a6694fb2f61',
        'name': 'Mike Mazowski',
        'is_admin': true,
      },
      {
        'image': 'photo-1532074205216-d0e1f4b87368',
        'name': 'Marvin Robertson',
        'is_admin': true,
      },
      {
        'image': 'photo-1525357816819-392d2380d821',
        'name': 'Gregory Robertson',
      },
      {
        'image': 'photo-1502323777036-f29e3972d82f',
        'name': 'Samuel Witnessa',
      },
      {
        'image': 'photo-1517702145080-e4a4d91435bb',
        'name': 'Bambang Wijayanto',
      },
      {
        'image': 'photo-1521132293557-5b908a59d1e1',
        'name': 'Sururi Mandatson',
      },
      {
        'image': 'photo-1522091759069-9fe8e6826b7f',
        'name': 'Michael Robbin',
      },
      {
        'image': 'photo-1517777557049-0f1f4537b849',
        'name': 'Jackobs Stewart',
      },
      {
        'image': 'photo-1526382925646-27b5eb86796e',
        'name': 'Anastasia Redborn',
      },
      {
        'image': 'photo-1529232356377-57971f020a94',
        'name': 'Fuetla Lamalida',
      },
      {
        'image': 'photo-1542727313-4f3e99aa2568',
        'name': 'Kimini Wildjackson',
      },
    ];
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: ListView(
        padding: const EdgeInsets.only(bottom: 20),
        children: [
          const SizedBox(height: 10),
          bookmarkTile(context,
              'The next thing we will consider is how to create our own kitchen set in our office!..'),
          bookmarkTile(context,
              'Pls keep a note that we will take a vacation on next weekend. Make sure you join the eve...'),
          bookmarkTile(context,
              'The event will be held in London. Sunday, 26th of April 2020. '),
          const SizedBox(height: 20),

          // See more
          Container(
            height: 40,
            width: double.infinity,
            decoration: BoxDecoration(
              // color: const Color(0xFFF7F7F7),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Center(
              child: Text(
                'See more',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF2D9CDB),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),

          //  Channels
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            height: 48,
            width: double.infinity,
            decoration: BoxDecoration(
                // color: const Color(0xFFFFFFFF),

                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Theme.of(context).dividerColor)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    AppSvgIcon('chats'),
                    SizedBox(
                      width: 16,
                    ),
                    Text(
                      '4 Channels',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Pallete.textSecondary.withOpacity(0.4),
                  size: 16,
                )
              ],
            ),
          ),
          const SizedBox(height: 24),

          //  People
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            width: double.infinity,
            decoration: BoxDecoration(
              // color: const Color(0xFFFFFFFF),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Theme.of(context).dividerColor,
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      children: [
                        AppSvgIcon('persons'),
                        SizedBox(
                          width: 16,
                        ),
                        Text(
                          '12 Peoples',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const AppSvgIcon('add person'),
                        const SizedBox(width: 24),
                        AppSvgIcon(
                          'search',
                          color: Pallete.blue1,
                        ),
                      ],
                    ),
                  ],
                ),
                const Divider(),
                Column(
                  children: peoplesData
                      .map((e) => peoples(e['image'], e['name'],
                          isMe: e['is_me'] ?? false,
                          isAdmin: e['is_admin'] ?? false))
                      .toList(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget peoples(String image, String name,
      {String status = 'online', bool isAdmin = false, bool isMe = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              AppProfileIcon(
                picture: image,
                status: status,
              ),
              const SizedBox(width: 16),
              Text(
                name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          if (isMe) ...[
            Text(
              'You',
              style: TextStyle(fontSize: 12, color: Pallete.textSecondary),
            ),
          ] else if (isAdmin) ...[
            Container(
              height: 24,
              decoration: BoxDecoration(
                  color: Pallete.blue1, borderRadius: BorderRadius.circular(8)),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: const Center(
                child: Text(
                  'Admin',
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
              ),
            ),
          ]
        ],
      ),
    );
  }

  Widget bookmarkTile(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Expanded(
            child: Text(
              text,
              style: TextStyle(color: Theme.of(context).primaryColorDark),
            ),
          ),
          const SizedBox(width: 21),
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
