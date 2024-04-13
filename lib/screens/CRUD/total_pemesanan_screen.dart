import 'package:flutter/material.dart';
import 'package:my_app/db/database_instance.dart';
import 'package:my_app/models/transaksi_model.dart';
import 'package:my_app/screens/CRUD/create_pemesanan_screen.dart';
import 'package:my_app/screens/CRUD/update_pemesanan_screen.dart';

class TotalPemesananScreen extends StatefulWidget {
  const TotalPemesananScreen({super.key});

  @override
  State<TotalPemesananScreen> createState() => _TotalPemesananScreenState();
}

class _TotalPemesananScreenState extends State<TotalPemesananScreen> {
 DatabaseInstance? databaseInstance;
  @override
  void initState() {
    databaseInstance = DatabaseInstance();
    initDatabase();
    super.initState();
  }

  Future initDatabase() async{
    await databaseInstance!.database();
    setState(() {
      
    });
  }


  showArlertDialog(BuildContext contex) {
    Widget okButton = TextButton(
      child : Text("Yakin?"),
      onPressed :(){},
    );

    AlertDialog alertDialog = AlertDialog(
      title: Text("Peringatan !"),
      content: Text("Anda yakin akan menghapus?"),
      actions: [okButton],
    );

    showDialog(
      context: context, 
      builder: (BuildContext context) {
      return alertDialog;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pesanan"),
      actions: [
        IconButton(onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreatePemesananScreen()));
        }, icon: Icon(Icons.add))],),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 10,),
            Text("Total Pesanan : Rp. 125.000"),
            SizedBox(height: 20),
            Text("Total Kembalian : Rp. 50.000"),
            FutureBuilder<List<TransaksiModel>>(
              future: databaseInstance!.getAll(),
              builder: (context, snapshot) {
                print('Hasil : ' +snapshot.data.toString());
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("Loading");
                } else {
                  if(snapshot.hasData) {
                    
                  }
                }
                return ListTile(
                  title: Text("Makanan"),
                  subtitle: Text("Rp. 10.000"),
                  leading: Icon(Icons.food_bank, color: Colors.brown),
                  trailing: Wrap(
                    children :[
                      IconButton(onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => UpdatePemesananScreen()));
                          }, icon: Icon(Icons.edit, color: Colors.grey,)),
                
                      SizedBox(width: 20),
                
                      IconButton(onPressed: (){
                        showArlertDialog(context);
                      }, icon: Icon(Icons.delete, color: Colors.red,))
                    ]),
                );
              }
            ),


            ]
          ),
      ),
    );
  }
}