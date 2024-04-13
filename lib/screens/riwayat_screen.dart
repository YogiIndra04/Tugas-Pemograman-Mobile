import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_app/screens/CRUD/total_pemesanan_screen.dart';
import 'package:my_app/screens/CRUD/update_pemesanan_screen.dart';
import 'package:my_app/screens/third_screen.dart';

class Riwayat extends StatelessWidget {
  const Riwayat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.money_sharp)),

              Tab(icon: Icon(Icons.watch_later_outlined)),
              Tab(icon: Icon(Icons.domain_verification_rounded)),
            ],
          ),
          title: const Text('Transaksi'),
        ),
        body: TabBarView(
          children: [
            const Icon(Icons.money),
            const Icon(Icons.timeline),
            
            Center(
                child: ElevatedButton(
              child: const Text('Go to Third Screen'),
              onPressed: () {
                Navigator.pushNamed(context, '/news_screen');
              },
            ))
          ],
        ),
      ),
    );
  }
}