import 'package:flutter/material.dart';

class UpdatePemesananScreen extends StatelessWidget {
  const UpdatePemesananScreen({super.key});

final _jumlah = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Update"),),
      body: SafeArea(child: 
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Nama Makanan"),
            TextField(),
            SizedBox(height: 20,),
            Text("Tipe"),
            ListTile(
              title: Text("Makanan"),
            leading: Radio(value: _jumlah, groupValue: 1, onChanged: (jumlah){})
            ),

            ListTile(
              title: Text("Minuman"),
            leading: Radio(value: _jumlah, groupValue: 2, onChanged: (jumlah){})
            ),

            SizedBox(height: 20,),

            Text("Total"),
            TextField(),

            SizedBox(height: 20,),
            
            ElevatedButton(onPressed: () {}, child: Text("Simpan"))

          ],
        ),
      )),
    );
  }
}