import 'package:flutter/material.dart';
import 'package:midterm_app/Page.2.dart';
import 'package:midterm_app/Page1.dart';
import 'package:midterm_app/Page3.dart';
import 'package:midterm_app/Page4.dart';
import 'package:midterm_app/Page5.dart';
import 'package:midterm_app/Page6.dart';
import 'package:provider/provider.dart';
import 'ActivityModel.dart';  

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ActivityModel()),  // เพิ่ม ActivityModel ใน MultiProvider
      ],
      child: MenuNavigationApp(),
    ),
  );
}

class MenuNavigationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menu Navigation App',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/page1': (context) => Page1(),
        '/page2': (context) => Page2(),
        '/page3': (context) => Page3(),
        '/page4': (context) => Page4(),
        '/page5': (context) => Page5(),
        '/page6': (context) => Page6(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            MenuButton(
              icon: Icons.route_outlined,
              caption: 'Activity',
              routeName: '/page1',
            ),
            SizedBox(height: 15),
            MenuButton(
              icon: Icons.account_circle,
              caption: 'History',
              routeName: '/page2',
            ),
            SizedBox(height: 15),
            MenuButton(
              icon: Icons.food_bank,
              caption: 'Food',
              routeName: '/page3',
            ),
            SizedBox(height: 15),
            MenuButton(
              icon: Icons.fitness_center,
              caption: 'Fitness',
              routeName: '/page4',
            ),
            SizedBox(height: 15),
            MenuButton(
              icon: Icons.chat,
              caption: 'Open chat',
              routeName: '/page5',
            ),
            SizedBox(height: 15),
            MenuButton(
              icon: Icons.store,
              caption: 'Store',
              routeName: '/page4',
            ),
          ],
        ),
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  final IconData icon;
  final String caption;
  final String routeName;

  MenuButton({required this.icon, required this.caption, required this.routeName});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, routeName);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 5, 88, 25),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.white),
            SizedBox(width: 20),
            Expanded(
              child: Text(
                caption,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BlankPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blank Page'),
      ),
      body: Center(
        child: Text('This is a blank page.'),
      ),
    );
  }
}

