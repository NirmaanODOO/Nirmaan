import 'package:flutter/material.dart';
import 'dashboard_screen.dart'; // Import DashboardScreen
import 'quiz_screen.dart';
import 'simulator_screen.dart';
import 'profile_screen.dart';

class ExpenseTrackerScreen extends StatefulWidget {
  @override
  _ExpenseTrackerScreenState createState() => _ExpenseTrackerScreenState();
}

class _ExpenseTrackerScreenState extends State<ExpenseTrackerScreen> {
  int _selectedIndex = 2; // Set "Expense Tracker" as the active tab

  void _onItemTapped(int index) {
    if (index == 0) {
      // Navigate to DashboardScreen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DashboardScreen()),
      );
    } else if (index == 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => QuizScreen()),
      );
    } else if (index == 3) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SimulatorScreen()),
      );
    } else if (index == 4) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ProfileScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Expense Tracker", style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: Text(
          "Expense Tracker Page",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.black, // Corrected selected text color
        unselectedItemColor: Color(0x4C595959), // Improved contrast for unselected items
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.quiz), label: "Quiz"),
          BottomNavigationBarItem(icon: Icon(Icons.money), label: "Expense Tracker"),
          BottomNavigationBarItem(icon: Icon(Icons.videogame_asset), label: "Simulator"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
