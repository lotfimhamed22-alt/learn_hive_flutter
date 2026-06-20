// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TestScreen extends StatelessWidget {
  TestScreen({super.key});
  late Box box;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                await Hive.openBox("testDelete");
                print("testDelete");
              },
              child: Text("Open Box"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await Hive.box("testDelete").putAll({
                  "name": "lotfi",
                  "age": 19,
                  "country": "Egypt",
                  "city": "New York",
                });
              },
              child: Text("add data"),
            ),

            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                Hive.box("testDelete").delete("country");
                // Hive.box("testDelete").deleteAll({"age", "country"});
                // Hive.box("testDelete").deleteAt(1);
                // await Hive.box("testDelete").clear(); // delete all keys
                // await Hive.box("testDelete").deleteFromDisk(); // delete from local storage
              },
              child: Text("Delete data"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                print("name :${Hive.box("testDelete").get("name")}");
                print("age :${Hive.box("testDelete").get("age")}");

                print("country :${Hive.box("testDelete").get("country")}");
                print("city :${Hive.box("testDelete").get("city")}");
              },
              child: Text("Display"),
            ),
          ],
        ),
      ),
    );
  }
}
