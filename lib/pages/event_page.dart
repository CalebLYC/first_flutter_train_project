import 'package:flutter/material.dart';

class EventPage extends StatefulWidget {
  const EventPage({Key? key}) : super(key: key);

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  final events = [
    {
      "speaker": "Lior Chamla",
      "date": "13h-13h30",
      "subject": "Le code legacy",
      "avatar": "conf1",
    },
    {
      "speaker": "Damien Cavaleis",
      "date": "13h-13h30",
      "subject": "Le git blame",
      "avatar": "conf2",
    },
    {
      "speaker": "Defend Inteligency",
      "date": "16h30-18h",
      "subject": "Les IAs génératives",
      "avatar": "conf3",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index) {
          final event = events[index];
          final avatar = event['avatar'];
          final speaker = event['speaker'];
          final date = event['date'];
          final subject = event['subject'];

          return Card(
            child: ListTile(
              leading: Image.asset(
                "assets/images/$avatar.jpeg",
                width: 80,
              ),
              title: Text('$speaker($date)'),
              subtitle: Text("$subject"),
              trailing: const Icon(Icons.more_vert),
            ),
          );
        },
      ),
    );
  }
}
