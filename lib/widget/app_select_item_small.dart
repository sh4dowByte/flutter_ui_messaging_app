import 'package:flutter/material.dart';

import '../config/pallete.dart';

class AppSelectItemSmall extends StatefulWidget {
  final List<Map<String, dynamic>> item;
  const AppSelectItemSmall({super.key, required this.item});

  @override
  State<AppSelectItemSmall> createState() => _AppSelectItemSmallState();
}

// final List<Map<String, dynamic>> category = [
//   {'id': 1, 'name': 'Soccer'},
//   {'id': 2, 'name': 'Basketball', 'icon': 'image 4.png'},
//   {'id': 3, 'name': 'Football', 'icon': 'image 2.png'},
//   {'id': 4, 'name': 'Baseball', 'icon': 'baseball_26be 1.png'},
//   {'id': 5, 'name': 'Tennis', 'icon': 'image 7.png'},
//   {'id': 6, 'name': 'Volleyball', 'icon': 'image 1.png'},
// ];
class _AppSelectItemSmallState extends State<AppSelectItemSmall> {
  int activeIds = 1;

  void toggleItemById(int id) {
    setState(() {
      activeIds = id;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 26,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: widget.item.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final item = widget.item[index];
          final isActive = activeIds == (item['id']); // Status aktif

          EdgeInsets margin = EdgeInsets.only(
            left: index == 0 ? 20 : 0,
            right: index == widget.item.length - 1 ? 20 : 0,
          );

          return GestureDetector(
            onTap: () => toggleItemById(item['id']),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              margin: margin,
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: isActive ? Pallete.blue1 : Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color:
                              Colors.black.withOpacity(0.03), // Warna bayangan
                          spreadRadius: 4, // Ukuran area bayangan
                          blurRadius: 10, // Seberapa lembut bayangan
                          offset: const Offset(5, 5), // Posisi bayangan (x, y)
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        if (item['icon'] != null) ...[
                          Image.asset(
                            'assets/${item['icon']}',
                            width: 20,
                            height: 20,
                            fit: BoxFit
                                .cover, // Menyesuaikan gambar dengan area yang tersedia
                          ),
                        ],
                        if (item['icon'] != null && isActive) ...[
                          const SizedBox(width: 8),
                        ],
                        if (isActive || item['icon'] == null) ...[
                          Text(
                            item['name'],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12,
                              color: isActive ? Colors.white : Colors.black,
                            ),
                          )
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
