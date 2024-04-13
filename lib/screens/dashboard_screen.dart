import 'package:flutter/material.dart';
//import 'package:my_app/components/asset_image_widget.dart';
//import 'package:my_app/components/text_container.dart';

class dashboardScreen extends StatelessWidget {
  const dashboardScreen({Key? key}) : super(key: key);

  @override
    Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 100,
              backgroundImage: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKpQ0fMhEj08FmuzeT-8sHFbJNtjPH6OJE6jVRSszueQ&s'),
            ),
            SizedBox(height: 20),
            Text(
              'Warung Makan Padalyang',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Actions when button is pressed
              },
              child: Text('Alamat'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Actions when button is pressed
              },
              child: Text('Sosial Media'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Actions when button is pressed
              },
              child: Text('WhatsApp '),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Actions when item is tapped
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Actions when item is tapped
              },
            ),
          ],
        ),
      ),
    );
  }
}
