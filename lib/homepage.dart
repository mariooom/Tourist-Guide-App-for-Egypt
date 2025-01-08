import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:tourism_app/navigation/favourite.dart';
import 'package:tourism_app/navigation/governments.dart';
import 'package:tourism_app/navigation/profile.dart';
import 'package:tourism_app/signup.dart';
import 'package:tourism_app/widgets/grid_view.dart';
import 'package:tourism_app/widgets/list_view.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final storedEmail = SignUpPage.userCredentials['email'];
  int currentPageIndex = 0;

  // List to store favorite places
  final Set<Map<String, String>> _favorites = {};

  // List of pages in the app
  final List<Widget> _pages = [
    HomeContent(),
    Favourite(favorites: []), // Favorites page
    Governments(onAddToFavorites: (place) {}), // Placeholder, will be updated
    ProfilePage(), // Profile page
  ];

  // Method to add a place to favorites
  void addToFavorites(Map<String, String> place) {
    setState(() {
      _favorites.add(place);
      // Update the Favourite page with the latest favorites
      _pages[1] = Favourite(favorites: _favorites.toList());
    });
  }

  @override
  void initState() {
    super.initState();
    // Initialize the Governments widget with the addToFavorites function
    _pages[2] = Governments(onAddToFavorites: addToFavorites);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFFf5ebe0),
        title: Text('Egypt', style: TextStyle(fontFamily: 'Cinzel')),
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        width: screenWidth * 0.7,
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'Welcome                 $storedEmail',
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.help,
                color: const Color(0xFFbc6c25),
              ),
              title: Text(
                'Help',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.logout,
                color: const Color(0xFFbc6c25),
              ),
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => SignUpPage()));
              },
              title: Text(
                'Log Out',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
      body: OpenContainer(
        transitionDuration: Duration(seconds: 1),
        closedBuilder: (context, action) {
          return _pages[currentPageIndex];
        },
        openBuilder: (context, action) {
          return _pages[currentPageIndex];
        },
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: Color(0xFFf5ebe0),
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
            // Update the Favourite page with the latest favorites
            if (index == 1) {
              _pages[1] = Favourite(favorites: _favorites.toList());
            }
          });
        },
        indicatorColor: Color(0xFFbc6c25),
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.favorite, color: Colors.white),
            icon: Icon(Icons.favorite_border),
            label: 'Favorites',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.place, color: Colors.white),
            icon: Icon(Icons.place_outlined),
            label: 'Governments',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.person, color: Colors.white),
            icon: Icon(Icons.person_outlined),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Suggestios',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Cinzel',
                      )),
                ),
                Container(
                  color: Color.fromARGB(255, 255, 251, 247),
                  width: screenWidth,
                  height: screenHeight * 0.35,
                  child: Suggestions(
                    onAddToFavorites: (place) {
                      final homeState = context.findAncestorStateOfType<_HomepageState>();
                      homeState?.addToFavorites(place);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Popular ',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Cinzel',
                      )),
                ),
                Container(
                  color: Color.fromARGB(255, 255, 251, 247),
                  width: screenWidth,
                  height: screenHeight * 0.4,
                  child: Popular(
                    onAddToFavorites: (place) {
                      final homeState = context.findAncestorStateOfType<_HomepageState>();
                      homeState?.addToFavorites(place);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}