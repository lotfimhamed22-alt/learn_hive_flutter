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
                box = await Hive.openBox("testGet"); // open box
                print("testGet is opened");
              },
              child: Text("Open Box"),
            ),
            SizedBox(height: 20),

            // ElevatedButton(
            //   onPressed: () {
            //     box.putAll({"name": "dod", "age": 19, "localization": "Egypt"});
            //   },
            //   child: Text("Accept Box"),
            // ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // box.add("lotfi");
                // box.add("Dod");
                // print("lotfi is added");
              },
              child: Text("add data"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                print(box.get(0));
                print(box.getAt(0));
                print(box.values.toList());
              },
              child: Text("Display"),
            ),
          ],
        ),
      ),
    );
  }
}
