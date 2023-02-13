//import 'package:first_flutter_train_project/pages/event_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/minia.jpeg"),
          const Text(
            "Assynconf 2022",
            style: TextStyle(
              fontSize: 42,
              fontFamily: 'Poppins',
            ),
          ),
          const Text(
            "Salon virtuel de l'informatique. Du 27 au 29 Octobre 2022",
            style: TextStyle(
              fontSize: 24,
            ),
            textAlign: TextAlign.center,
          ),
          const Padding(padding: EdgeInsets.only(top: 20)),
          /*ElevatedButton.icon(
            style: const ButtonStyle(
              padding: MaterialStatePropertyAll(EdgeInsets.all(20)),
              backgroundColor: MaterialStatePropertyAll(Colors.green),
            ),
            onPressed: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (_, __, ___) => const EventPage(),
                ),
              );
            },
            label: const Text(
              "Afficher le planning",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            //child: const Icon(Icons.add_a_photo),
            icon: const Icon(Icons.calendar_month),
          ),*/
        ],
      ),
    );
  }
}
