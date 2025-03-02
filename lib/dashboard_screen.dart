import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'expense_tracker.dart'; // Import the Expense Tracker screen
import 'home_screen.dart';
import 'quiz_screen.dart' as quiz;
import 'simulator_screen.dart' as simulator;
import 'profile_screen.dart' as profile;

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0; // Set "Home" as the active tab

  void _onItemTapped(int index) {
    if (index != _selectedIndex) {
      setState(() {
        _selectedIndex = index;
      });

      // Navigate to other screens
      switch (index) {
        case 0:
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
          break;
        case 1:
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => quiz.QuizScreen()));
          break;
        case 2:
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ExpenseTrackerScreen()));
          break;
        case 3:
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => simulator.SimulatorScreen()));
          break;
        case 4:
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => profile.ProfileScreen()));
          break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Welcome Back, Odoo!",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            CircleAvatar(
              backgroundImage: AssetImage('assets/profile.jpg'), // Ensure this image exists
              radius: 20,
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildMoneyTracker(),
                  SizedBox(height: 20),
                  _buildVideoTutorial(),
                  SizedBox(height: 20),
                  _buildQuizProgress(), // Newly added
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
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

  Widget _buildMoneyTracker() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.purple.shade700,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Money Tracker", style: TextStyle(color: Colors.white, fontSize: 18)),
          SizedBox(height: 10),
          SizedBox(
            height: 150,
            child: BarChart(
              BarChartData(
                barGroups: [
                  _buildBar(0, 250),
                  _buildBar(1, 300),
                  _buildBar(2, 150),
                  _buildBar(3, 100),
                  _buildBar(4, 50),
                ],
                borderData: FlBorderData(show: false),
                gridData: FlGridData(show: false),
                titlesData: FlTitlesData(show: false),
              ),
            ),
          ),
        ],
      ),
    );
  }

  BarChartGroupData _buildBar(int x, double y) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          width: 16,
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
        )
      ],
    );
  }

  Widget _buildVideoTutorial() {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        color: Colors.yellow.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Icon(Icons.play_circle_fill, size: 50, color: Colors.black),
      ),
    );
  }

  Widget _buildQuizProgress() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Quiz Progress", style: TextStyle(color: Colors.white, fontSize: 18)),
        SizedBox(height: 10),
        _buildQuizCard("Quiz 4", "04-03-2025", "9/10"),
        _buildQuizCard("Quiz 3", "03-03-2025", "7/10"),
        _buildQuizCard("Quiz 2", "02-03-2025", "8/10"),
        _buildQuizCard("Quiz 1", "01-03-2025", "6/10"),
      ],
    );
  }

  Widget _buildQuizCard(String title, String date, String score) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.purple.shade400,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(height: 4),
              Text(date, style: TextStyle(color: Colors.white70, fontSize: 14)),
            ],
          ),
          Text(score, style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
