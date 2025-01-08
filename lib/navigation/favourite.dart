import 'package:flutter/material.dart';

class Favourite extends StatelessWidget {
  final List<Map<String, String>> favorites;

  Favourite({required this.favorites});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
        backgroundColor: Color(0xFFf5ebe0),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          final place = favorites[index];
          return Card(
            color: Color(0xFFf5ebe0),
            child: ListTile(
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  place['image']!,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                place['name']!,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          );
        },
      ),
    );
  }
}
