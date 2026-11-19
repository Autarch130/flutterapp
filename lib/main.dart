import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Сетка',
      debugShowCheckedModeBanner: false,
      home: const GridPage(),
    );
  }
}

class GridPage extends StatelessWidget {
  const GridPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Сетка 3x3')),
      body: GridView.count(
        crossAxisCount: 3,
        padding: const EdgeInsets.all(8),
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 0.8,
        children: const [
          // Интернет-lib\assets\images\local1.jpg
          PhotoCard(
            source: 'lib/assets/images/local1.jpg',
            title: 'Фото1',
            isNetwork: true,
            titleStyle: TitleStyle.bold,
          ),
          PhotoCard(
            source: 'lib/assets/images/local2.jpg',
            title: 'Фото2',
            isNetwork: true,
            titleStyle: TitleStyle.italic,
          ),
          PhotoCard(
            source: 'lib/assets/images/local3.png',
            title: 'Фото3',
            isNetwork: true,
            titleStyle: TitleStyle.colored,
          ),
          // Ассеты
          PhotoCard(
            source: 'lib/assets/images/local1.jpg',
            title: 'Фото1',
            isNetwork: true,
            titleStyle: TitleStyle.bold,
          ),
          PhotoCard(
            source: 'lib/assets/images/local2.jpg',
            title: 'Фото2',
            isNetwork: true,
            titleStyle: TitleStyle.italic,
          ),
          PhotoCard(
            source: 'lib/assets/images/local3.png',
            title: 'Фото3',
            isNetwork: true,
            titleStyle: TitleStyle.colored,
          ),
          PhotoCard(
            source: 'lib/assets/images/local1.jpg',
            title: 'Фото1',
            isNetwork: true,
            titleStyle: TitleStyle.colored,
          ),
          PhotoCard(
            source: 'lib/assets/images/local4.jpg',
            title: 'Фото4',
            isNetwork: true,
            titleStyle: TitleStyle.bold,
          ),
          PhotoCard(
            source: 'lib/assets/images/local2.jpg',
            title: 'Фото2',
            isNetwork: true,
            titleStyle: TitleStyle.italic,
          ),
        ],
      ),
    );
  }
}

// Стили подписей
enum TitleStyle { bold, italic, colored }

class PhotoCard extends StatelessWidget {
  final String source;
  final String title;
  final bool isNetwork;
  final TitleStyle titleStyle;

  const PhotoCard({
    super.key,
    required this.source,
    required this.title,
    required this.isNetwork,
    required this.titleStyle,
  });

  TextStyle _getStyle() {
    switch (titleStyle) {
      case TitleStyle.bold:
        return const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        );
      case TitleStyle.italic:
        return const TextStyle(
          fontSize: 13,
          fontStyle: FontStyle.italic,
          color: Colors.black87,
        );
      case TitleStyle.colored:
        return const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: Colors.deepPurple,
          letterSpacing: 1,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: isNetwork
                ? Image.network(
                    source,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    errorBuilder: (_, __, ___) => Container(
                      color: Colors.grey[300],
                      child: const Icon(Icons.broken_image),
                    ),
                    loadingBuilder: (context, child, progress) {
                      if (progress == null) return child;
                      return Container(
                        color: Colors.grey[200],
                        child: const Center(child: CircularProgressIndicator()),
                      );
                    },
                  )
                : Image.asset(
                    source,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    errorBuilder: (_, __, ___) => Container(
                      color: Colors.grey[300],
                      child: const Icon(Icons.image_not_supported),
                    ),
                  ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: _getStyle(),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
