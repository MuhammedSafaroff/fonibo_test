import 'package:flutter/material.dart';
import 'package:fonibo_test/view/drawer_menu.dart';
import 'package:fonibo_test/view/task_item.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xff0176E1)),
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        title: Text(
          'task.',
          style: TextStyle(
              color: Color(0xff0176E1),
              fontSize: 22.0,
              fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: double.maxFinite,
        color: Colors.white,
        padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Tasks",
              style: TextStyle(
                  color: Color(0xff333232),
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 20),
            Tasks(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Color(0xff0176E1),
          size: 34,
        ),
        backgroundColor: Colors.white,
        onPressed: () {},
      ),
      drawer: DrawerMenu(),
    );
  }
}
