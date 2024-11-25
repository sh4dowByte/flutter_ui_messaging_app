// ignore_for_file: unused_element

import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UnsplashService {
  // Mendapatkan URL gambar acak
  static Future<String> getRandomImage(
      {String? query, int? width, int? height, int quality = 1080}) async {
    // Pilih elemen secara acak
    final random = Random();

    final page = random.nextInt(35);

    String endpoint =
        'https://unsplash.com/napi/search/photos?page=$page&per_page=30&query=random&xp=search-region-awareness%3Acontrol';

    final uri = Uri.parse(endpoint);

    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);

        final results = data['results'];
        final index = random.nextInt(results.length);

        String imageUrl = results[index]['urls']['regular'];
        imageUrl = imageUrl.replaceFirst(RegExp(r'w=\d+'), 'w=$quality');

        return imageUrl;
      } else {
        throw Exception(
            'Failed to fetch image. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching image: $e');
    }
  }
}

class UnsplashWidget extends StatelessWidget {
  const UnsplashWidget({super.key});

  static Widget getRandom(
      {String? query, int? width, int? height, BoxFit? fit}) {
    final imageFuture = UnsplashService.getRandomImage(
        query: query, width: width, height: height);

    return FutureBuilder<String>(
      future: imageFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: SizedBox(
              width: 30,
              height: 30,
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData) {
          return Image.network(
            snapshot.data!,
            fit: fit ?? BoxFit.cover,
            width: width?.toDouble(),
            height: height?.toDouble(),
          );
        } else {
          return const Text('No image found.');
        }
      },
    );
  }

  static Widget getById(String id,
      {double quality = 1000,
      int? width = 100,
      int? height = 100,
      BoxFit? fit,
      bool isPremiumImage = false}) {
    final String subdomain = isPremiumImage ? 'plus' : 'images';
    final image =
        'https://$subdomain.unsplash.com/$id?q=80&w=$quality&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';

    return Image.network(
      image,
      fit: fit ?? BoxFit.cover, // Pastikan nilai fit default diterapkan
      width: width?.toDouble(), // Jika ada width, gunakan double
      height: height?.toDouble(), // Jika ada height, gunakan double
      loadingBuilder: (context, child, loadingProgress) {
        // Jika gambar sedang dimuat, tampilkan CircularProgressIndicator
        if (loadingProgress == null) {
          return child;
        }

        return Stack(
          children: [
            getById(id,
                quality: 100,
                width: width,
                height: height,
                fit: fit,
                isPremiumImage: isPremiumImage),
            Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        (loadingProgress.expectedTotalBytes ?? 1)
                    : null,
              ),
            )
          ],
        );
      },
      errorBuilder: (context, error, stackTrace) {
        // Menampilkan pesan error jika gagal memuat gambar

        return const Center(
          child: Text('Failed to load image'),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
