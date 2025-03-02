import 'package:flutter/material.dart';

void main() {
runApp(const MyApp());
}

class MyApp extends StatelessWidget {
const MyApp({super.key});

@override
Widget build(BuildContext context) {
return MaterialApp(
debugShowCheckedModeBanner: false,
home: const HomeScreen(),
);
}
}

class HomeScreen extends StatefulWidget {
const HomeScreen({super.key});

@override
State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
final ValueNotifier<int> _counter = ValueNotifier<int>(0);

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: const Text("Flutter UI Fix"),
),
body: Center(
child: Stack(
alignment: Alignment.center,
children: [
Container(
width: MediaQuery.of(context).size.width * 0.9,
height: MediaQuery.of(context).size.height * 0.5,
decoration: BoxDecoration(
color: Colors.blue.shade100,
borderRadius: BorderRadius.circular(20),
),
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
const Text(
"Counter Value:",
style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
),
ValueListenableBuilder<int>(
valueListenable: _counter,
builder: (context, value, child) {
return Text(
"$value",
style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
);
},
),
const SizedBox(height: 20),
ElevatedButton(
onPressed: () => _counter.value++,
child: const Text("Increment"),
),
],
),
),
],
),
),
);
}
}
