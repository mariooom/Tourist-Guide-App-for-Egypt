import 'package:flutter/material.dart';

class Popular extends StatelessWidget {
  final Function(Map<String, String>) onAddToFavorites;

  const Popular({Key? key, required this.onAddToFavorites}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: screenHeight * 0.3,
      width: screenWidth,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 1,
        itemBuilder: (context, index) {
          return Row(
            children: [
              _buildPlaceCard(
                context,
                'Giza Pyramids',
                'Giza Governorate',
                'assets/images/giza.jpg',
              ),
              _buildPlaceCard(
                context,
                'Luxor Temple',
                'Luxor Governorate',
                'assets/images/luxor.jpg',
              ),
              _buildPlaceCard(
                context,
                'Nuba Village',
                'Aswan Governorate',
                'assets/images/nuba.jpg',
              ),
              _buildPlaceCard(
                context,
                'Philae Temple',
                'Aswan Governorate',
                'assets/images/aswan.jpg',
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildPlaceCard(
    BuildContext context,
    String name,
    String governorate,
    String imagePath,
  ) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Card(
        elevation: 5.0,
        margin: EdgeInsets.only(bottom: 16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        borderOnForeground: true,
        color: Color(0xFFf5ebe0),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                imagePath,
                height: 170,
                width: 170,
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
              Text(
                name,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Text(
                governorate,
                style: TextStyle(
                  fontSize: 16,
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
        ),
      ),
    );
  }
}
