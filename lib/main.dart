import 'package:flutter/material.dart';
import 'package:tourism_app/signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const WelcomePage(),
    );
  }
}

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    //responsive design using MediaQuery
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/welcome_page.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: screenHeight * 0.1,
                ),
                child: const Text(
                  'Welcome to Egypt',
                  style: TextStyle(
                    fontSize: 38,
                    fontFamily: 'Merienda',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.1),
              Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.2),
                child: MaterialButton(
                  height: screenHeight * 0.07,
                  minWidth: screenWidth * 0.7,
                  onPressed: () {
                    
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            const SignUpPage(),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        },
                        transitionDuration: const Duration(seconds: 1),
                      ),
                    );
                  },
                  color: const Color(0xFFbc6c25),
                  textColor: Colors.white,
                  child: const Text(
                    'Get Started',
                    style: TextStyle(fontSize: 26, fontFamily: 'Cinzel',),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
