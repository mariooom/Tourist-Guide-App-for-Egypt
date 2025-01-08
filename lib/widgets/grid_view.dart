import 'package:flutter/material.dart';

class Suggestions extends StatelessWidget {
  final Function(Map<String, String>) onAddToFavorites;

  Suggestions({required this.onAddToFavorites});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth,
      child: GridView(
        scrollDirection: Axis.vertical,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 20.0,
          childAspectRatio: 0.65,
        ),
        children: [
          _buildPlaceCard(
            context,
            'Sharm El-Sheikh',
            'assets/images/sharm.jpg',
          ),
          _buildPlaceCard(
            context,
            'Marsa Alam',
            'assets/images/marsa_alam.jpg',
          ),
          _buildPlaceCard(
            context,
            'Fayoum Oasis',
            'assets/images/Fayoum.jpg',
          ),
          _buildPlaceCard(
            context,
            'Elba Mountain',
            'assets/images/elba-m.jpg',
          ),
        ],
      ),
    );
  }

  Widget _buildPlaceCard(BuildContext context, String name, String imagePath) {
    return Card(
      color: Color(0xFFf5ebe0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              imagePath,
              height: 170,
              width: 170,
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
          ),
          Text(
            name,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Added to favourites')),
              );
              onAddToFavorites({
                'name': name,
                'image': imagePath,
              });
            },
            icon: Icon(Icons.favorite_border),
          ),
        ],
      ),
    );
  }
}