import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountEmail: Text(
              'mmsafaroff@gmail.com',
              style: TextStyle(fontSize: 12),
            ),
            accountName: Text(
              'Muhammed Safaroff',
              style: TextStyle(fontSize: 16),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/images/profile.jpg'),
              radius: 30,
            ),
            decoration: BoxDecoration(
              color: Color(0xff0176E1),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.home,
              color: Color(0xff0176E1),
            ),
            title: Text(
              'Home',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.person,
              color: Color(0xff0176E1),
            ),
            title: Text(
              'My account',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Divider(
            height: 10,
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
            ),
            title: Text(
              'Settings',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.help,
              color: Color(0xFF00B615),
            ),
            title: Text(
              'About',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
