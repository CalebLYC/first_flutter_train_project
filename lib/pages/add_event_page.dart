import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';

class AddEventPage extends StatefulWidget {
  const AddEventPage({super.key});

  @override
  State<AddEventPage> createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  final _formKey = GlobalKey<FormState>();

  final confNameController = TextEditingController();
  final speakerNameController = TextEditingController();

  String selectedConfType = 'talk';
  DateTime selectedDate = DateTime.now();

  /*@override
  void dispose() {
    confNameController.dispose();
    speakerNameController.dispose();
  }*/

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: TextFormField(
                  controller: confNameController,
                  decoration: const InputDecoration(
                    labelText: "Nom de la conférence",
                    hintText: "Entrer le nom de la conférence",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Ce champ est obligatoire";
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: TextFormField(
                  controller: speakerNameController,
                  decoration: const InputDecoration(
                    labelText: "Nom du speaker",
                    hintText: "Entrer le nom du speaker",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Ce champ est obligatoire";
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: DropdownButtonFormField(
                  items: const [
                    DropdownMenuItem(
                      child: Text("Talk show"),
                      value: 'talk',
                    ),
                    DropdownMenuItem(
                      child: Text("Demo code"),
                      value: 'demo',
                    ),
                    DropdownMenuItem(
                      child: Text("Partner"),
                      value: 'partner',
                    ),
                  ],
                  value: selectedConfType,
                  onChanged: (value) {
                    setState(() {
                      selectedConfType = value!;
                    });
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: DateTimeFormField(
                  decoration: const InputDecoration(
                    hintStyle: TextStyle(color: Colors.black45),
                    errorStyle: TextStyle(color: Colors.redAccent),
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.event_note),
                    labelText: 'Choisir une date',
                  ),
                  mode: DateTimeFieldPickerMode.dateAndTime,
                  autovalidateMode: AutovalidateMode.always,
                  validator: (e) =>
                      (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
                  onDateSelected: (DateTime value) {
                    setState(() {
                      selectedDate = value;
                    });
                  },
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    String confName = confNameController.text;
                    String speakerName = speakerNameController.text;

                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Envoie en cours")));
                    }
                    FocusScope.of(context).requestFocus(FocusNode());
                    print(
                        "La conférence $confName ajouté par le speaker $speakerName");
                    print("Type de conférence: $selectedConfType");
                    print("Date de la conférence: $selectedDate");
                  },
                  child: const Text("Ajouter"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
