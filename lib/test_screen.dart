// ignore_for_file: unused_element, avoid_print, must_be_immutable
import 'package:apply_hive_course/person_class/person_class.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TestScreen extends StatelessWidget {
  TestScreen({super.key});
  late final Box box;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                box = await Hive.openBox("testBox");
                print("testBox");
              },
              child: Text("Open Box"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                box.put("test", getPerson());
              },
              child: Text("add data"),
            ),

            SizedBox(height: 20),
            ElevatedButton(onPressed: () {}, child: Text("Delete data")),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                PersonClass person = box.get("test");
                print(person.name);
                print(person.age);
                print(person.friends[0].name);
              },
              child: Text("Display"),
            ),
          ],
        ),
      ),
    );
  }

  PersonClass getPerson() {
    return PersonClass(
      name: "lotfi",
      age: 19,
      friends: [
        PersonClass(
          name: "Dod",
          age: 19,
          friends: [PersonClass(name: "Lol", age: 19, friends: [])],
        ),
      ],
    );
  }
}
