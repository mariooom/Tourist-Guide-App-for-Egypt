import 'package:flutter/material.dart';
import 'package:tourism_app/signup.dart';

class ProfilePage extends StatelessWidget {
  String _hashPassword(String password) {
    return '*' *
        password.length; //function to display password hashed for security
  }

  @override
  Widget build(BuildContext context) {
    final storedFirstName = SignUpPage.userCredentials['fullName'] ?? 'N/A';
    final storedLastName = SignUpPage.userCredentials['lastName'] ?? 'N/A';
    final storedEmail = SignUpPage.userCredentials['email'] ?? 'N/A';
    final storedPassword = SignUpPage.userCredentials['password'] ?? 'N/A';
    final storedPhoneNumber = SignUpPage.userCredentials['phoneNumber'] ?? 'N/A';
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Profile',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              fontFamily: 'Cinzel',
            )),
        backgroundColor: Color(0xFFf5ebe0),
      ),
      body: Center(
        child: Container(
          height: screenHeight * 0.7,
          width: screenWidth * 0.9,
          decoration: BoxDecoration(
            color: Color(0xFFf5ebe0),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(30),
                child: Center(
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: Color.fromARGB(255, 203, 166, 133),
                    child: Padding(
                      padding: const EdgeInsets.all(1),
                      child: ClipOval(
                        //to make image into circle
                        child: Image.asset('assets/images/signup.jpg'),
                      ),
                    ),
                  ),
                ),
              ),
              Divider(
                indent: 10,
                endIndent: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'First Name:  $storedFirstName',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Last Name:   $storedLastName',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Email:  $storedEmail',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Phone Number:   $storedPhoneNumber',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Password:   ${_hashPassword(storedPassword)}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 40),
              Center(
                child: MaterialButton(
                  height: screenHeight * 0.07,
                  minWidth: screenWidth * 0.36,
                  color: const Color(0xFFbc6c25),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => SignUpPage()));      //to return to sign up page
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'Log Out',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 0.05,
                      fontFamily: 'Cinzel',
                    ),
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
