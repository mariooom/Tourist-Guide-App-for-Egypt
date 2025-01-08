import 'package:flutter/material.dart';
import 'package:tourism_app/navigation/landmark.dart';

class Governments extends StatelessWidget {
  final Function(Map<String, String>) onAddToFavorites;

  Governments({required this.onAddToFavorites});

  final List<Map<String, String>> governorates = [
    {
      'name': 'Cairo',
      'image': 'assets/images/cairo.jpg',
    },
    {
      'name': 'Alexandria',
      'image': 'assets/images/alex.jpg',
    },
    {
      'name': 'Luxor',
      'image': 'assets/images/luxorG.jpg',
    },
    {
      'name': 'Aswan',
      'image': 'assets/images/aswan.jpg',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Governments',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            fontFamily: 'Cinzel',
          ),
        ),
        backgroundColor: Color(0xFFf5ebe0),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: governorates.length,
        itemBuilder: (context, index) {
          final governorate = governorates[index];
          return Card(
            elevation: 5.0,
            margin: EdgeInsets.only(bottom: 16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: InkWell(
              onTap: () {
                //to navigate to the landmarks page for the selected governorate
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LandmarksPage(
                      governorate: governorate['name']!,
                      onAddToFavorites: onAddToFavorites,
                    ),
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ClipRRect(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(10.0)),
                    child: Image.asset(
                      governorate['image']!,
                      height: 150.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      governorate['name']!,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
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
