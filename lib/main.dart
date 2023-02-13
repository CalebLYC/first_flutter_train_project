import 'package:first_flutter_train_project/pages/add_event_page.dart';
import 'package:first_flutter_train_project/pages/event_page.dart';
import 'package:first_flutter_train_project/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _indexCurrent = 0;

  void setCurrentIndex(int index) {
    setState(() {
      _indexCurrent = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: [
            const Text("Acceuil"),
            const Text("Liste des conférences"),
            const Text("Formulaire d'ajout des conférences"),
          ][_indexCurrent],
        ),
        body: [
          const HomePage(),
          const EventPage(),
          const AddEventPage(),
        ][_indexCurrent],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _indexCurrent,
          onTap: ((index) => setCurrentIndex(index)),
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey,
          iconSize: 35,
          elevation: 10,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Acceuil',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month),
              label: 'Planning',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Ajout',
            ),
          ],
        ),
      ),
    );
  }
}
