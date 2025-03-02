import 'package:flutter/material.dart';
import 'onboarding_screen.dart';
import 'splash_screen.dart';
import 'home_screen.dart';
import 'signup_screen.dart';
import 'login_screen.dart';
import 'expense_tracker.dart';
import 'dashboard_screen.dart';
import 'quiz_screen.dart';
import 'simulator_screen.dart';
import 'profile_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/onboarding', // ✅ Starts with Onboarding
      routes: {
        '/onboarding': (context) => OnboardingScreen(),
        '/splash': (context) => SplashScreen(),
        '/home': (context) => HomeScreen(),
        '/signup': (context) => SignupScreen(),
        '/login': (context) => LoginScreen(),
        '/expense_tracker': (context) => ExpenseTrackerScreen(),
        '/dashboard': (context) => DashboardScreen(), // ✅ Dashboard added
        '/auth': (context) => AuthScreen(), // ✅ Auth handling
        '/quiz': (context) => QuizScreen(),
        '/simulator': (context) => SimulatorScreen(),
        '/profile': (context) => ProfileScreen(),
      },
    );
  }
}

// 🟢 Auth Screen (Handles navigation to Signup/Login)
class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/signup'),
              child: Text('Sign Up'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/login'),
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

// 🟢 Dashboard Screen (Handles bottom navigation)
class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    if (index == _selectedIndex) return;

    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/dashboard'); // ✅ Home
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/quiz'); // ✅ Quiz
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/expense_tracker'); // ✅ Expense Tracker
        break;
      case 3:
        Navigator.pushReplacementNamed(context, '/simulator'); // ✅ Simulator
        break;
      case 4:
        Navigator.pushReplacementNamed(context, '/profile'); // ✅ Profile
        break;
    }

    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.black,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.quiz), label: "Quiz"),
          BottomNavigationBarItem(icon: Icon(Icons.money), label: "Expense"),
          BottomNavigationBarItem(icon: Icon(Icons.videogame_asset), label: "Simulator"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
