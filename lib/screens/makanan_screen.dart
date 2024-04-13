// ignore_for_file: library_private_types_in_public_api
//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/dto/books.dart';
import 'package:my_app/screens/CRUD/create_pemesanan_screen.dart';
import 'package:my_app/screens/CRUD/test_crud.dart';
import 'package:my_app/screens/CRUD/total_pemesanan_screen.dart';
import 'package:my_app/screens/CRUD/update_pemesanan_screen.dart';

class MakananScreen extends StatefulWidget {
  const MakananScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<MakananScreen> {
  int _count = 0;
  final String imageUrl = 'https://picsum.photos/250?image=9';

  void _increment() {
    setState(() {
      _count++;
    });
  }

  void _decrement() {
    if (_count > 0) {
      setState(() {
        _count--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CreatePemesananScreen()),
                );
        },
      child: Badge(
        
        //textStyle: GoogleFonts.montserrat(color: Colors.white),
        child: Icon(Icons.shopping_bag),
      )
      ),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRg1IiAaaHZRXmVRqO3LOpU_nJUaADu2GJBSWyHRvRVXw&s"))),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text(
                  "Nasi Campur",
                  style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
            
                SizedBox(
                  height: 8,
                ),
            
                Text(
                  "Nasi Campur adalah menu favorit dan juga menjadi hidangan utama dalam warung padalyang",
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.montserrat(fontSize: 14),
                  ),
            
                SizedBox(
                  height: 8,
                ),
                
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Rp. 13.000',
                    style: GoogleFonts.montserrat(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
            
                Row( children: [
            
                IconButton(onPressed: _increment, icon: const Icon(Icons.add_circle,
                  color: Colors.green,)),
                  SizedBox(
                    width: 10,
                  ),
                Text('$_count'),
                  SizedBox(
                    width: 10,
                  ),
                IconButton(onPressed: _decrement, icon: const Icon(Icons.remove_circle,
                  color: Colors.red,)),
                  SizedBox(
                    width: 10,
                  ),
                  ],)
            
                    ],)
                  ],),
                 )
              ],),
                Row( //
              crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9GzozVk0jswaX0AfNhZadpKERK-09oW3b2mmoyOB7VQ&s"))),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text(
                  "Sate Lilit",
                  style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
            
                SizedBox(
                  height: 8,
                ),
            
                Text(
                  "Sate Lilit adalah menu variasi dan juga menjadi hidangan pelengkap untuk menemani Nasi Campur",
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.montserrat(fontSize: 14),
                  ),
            
                SizedBox(
                  height: 8,
                ),
                
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Rp. 10.000',
                    style: GoogleFonts.montserrat(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
            
                Row( children: [
            
                IconButton(onPressed: _increment, icon: const Icon(Icons.add_circle,
                  color: Colors.green,)),
                  SizedBox(
                    width: 10,
                  ),
                Text('$_count'),
                  SizedBox(
                    width: 10,
                  ),
                IconButton(onPressed: _decrement, icon: const Icon(Icons.remove_circle,
                  color: Colors.red,)),
                  SizedBox(
                    width: 10,
                  ),
                  ],)
            
                    ],)
                  ],),
                 )
              ],),

                Row( // copy atau delete dari sini
              crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage("https://www.kintamani.id/wp-content/uploads/Pepes-Telengis-Khas-Bali-1.jpg"))),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text(
                  "Pesan Ikan Tuna",
                  style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
            
                SizedBox(
                  height: 8,
                ),
            
                Text(
                  "Pesan Ikan Tuna adalah variasi menu yang ada di Warung Padalyang yang terbuat dari olahaan daging Ikan Tuna",
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.montserrat(fontSize: 14),
                  ),
            
                SizedBox(
                  height: 8,
                ),
                
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Rp. 7.000',
                    style: GoogleFonts.montserrat(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
            
                Row( children: [
            
                IconButton(onPressed: _increment, icon: const Icon(Icons.add_circle,
                  color: Colors.green,)),
                  SizedBox(
                    width: 10,
                  ),
                Text('$_count'),
                  SizedBox(
                    width: 10,
                  ),
                IconButton(onPressed: _decrement, icon: const Icon(Icons.remove_circle,
                  color: Colors.red,)),
                  SizedBox(
                    width: 10,
                  ),
                  ],)
            
                    ],)
                  ],),
                 )
              ],), // copy atau delete di sini
              
                              Row( // copy atau delete dari sini
              crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage("https://awsimages.detik.net.id/community/media/visual/2021/06/19/laris-sate-pertok-langganan-ahmad-dhani-laku-10-ribu-tusuk-sehari-7_169.jpeg?w=1200"))),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text(
                  "Sate Tusuk Ikan",
                  style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
            
                SizedBox(
                  height: 8,
                ),
            
                Text(
                  "Sate Tusuk Ikan Tuna adalah variasi menu yang ada di Warung Padalyang yang terbuat dari olahaan daging Ikan",
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.montserrat(fontSize: 14),
                  ),
            
                SizedBox(
                  height: 8,
                ),
                
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Rp. 10.000',
                    style: GoogleFonts.montserrat(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
            
                Row( children: [
            
                IconButton(onPressed: _increment, icon: const Icon(Icons.add_circle,
                  color: Colors.green,)),
                  SizedBox(
                    width: 10,
                  ),
                Text('$_count'),
                  SizedBox(
                    width: 10,
                  ),
                IconButton(onPressed: _decrement, icon: const Icon(Icons.remove_circle,
                  color: Colors.red,)),
                  SizedBox(
                    width: 10,
                  ),
                  ],)
            
                    ],)
                  ],),
                 )
              ],), //copy atau delete sampe sini

              
          ],
        )),
    );
  }
}
