import 'package:flutter/material.dart';

class LandmarksPage extends StatelessWidget {
  final String governorate;
  final Function(Map<String, String>) onAddToFavorites;

  LandmarksPage({super.key, required this.governorate, required this.onAddToFavorites});

  final Map<String, List<Map<String, String>>> landmarks = {
    'Cairo': [
      {'name': 'Egyptian Museum', 'image': 'assets/images/EM.jpg'},
      {
        'name': 'Salah Al-Din Al-Ayoubi Citadel',
        'image': 'assets/images/mma.jpeg'
      },
    ],
    'Alexandria': [
      {'name': 'Qaitbay Citadel', 'image': 'assets/images/alexQ.jpg'},
      {'name': 'Bibliotheca Alexandrina', 'image': 'assets/images/alexL.jpg'},
    ],
    'Luxor': [
      {'name': 'Valley of the Kings', 'image': 'assets/images/ht.jpg'},
      {'name': 'Karnak Temple', 'image': 'assets/images/KT.jpg'},
    ],
    'Aswan': [
      {'name': 'Philae Temple', 'image': 'assets/images/PT.jpg'},
      {'name': 'Ramesses Temple', 'image': 'assets/images/RT.jpg'}
    ]
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Landmarks in $governorate',
          style: TextStyle(fontFamily: 'Cinzel'),
        ),
        backgroundColor: Color(0xFFf5ebe0),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: landmarks[governorate]!.length,
        itemBuilder: (context, index) {
          final landmark = landmarks[governorate]![index];
          return Card(
            color: Color(0xFFf5ebe0),
            elevation: 5.0,
            margin: EdgeInsets.only(bottom: 16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(10.0)),
                  child: Image.asset(
                    landmark['image']!,
                    height: 170.0,
                    width: 170.0,
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    landmark['name']!,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.favorite_border),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Added to favourites')),
                    );
                    onAddToFavorites(landmark);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
