import 'package:flutter/material.dart';
import 'package:my_app/dto/books.dart';
import 'package:my_app/services/db_helper.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Pesanan extends StatefulWidget {
  const Pesanan({super.key});

  @override
  State<Pesanan> createState() => _PesananScreenState();
}

class _PesananScreenState extends State<Pesanan> {
  final GlobalKey<FormState> _formStateKey = GlobalKey<FormState>();
  Future<List<Menu>>? books;
  late String _menu;
  bool isUpdate = false;
  late int? pesananIdForUpdate;
  late DBHelper dbHelper;
  final _menuTitleController = TextEditingController();

  @override
  void initState() {
    super.initState();
    dbHelper = DBHelper();
    refreshBookLists();
  }

  @override
  void dispose() {
    _menuTitleController.dispose();
    dbHelper.close();
    super.dispose();
  }

  void cancelTextEditing() {
    _menuTitleController.text = '';
    setState(() {
      isUpdate = false;
      pesananIdForUpdate = null;
    });
    closeKeyboard();
  }

  void closeKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  Future<void> refreshBookLists() async {
    try {
      await dbHelper.initDatabase();
      setState(() {
        books = dbHelper.getBooks();
        isUpdate = false;
      });
    } catch (error) {
      debugPrint('Error fetching Menu: $error');
    }
  }

  void createOrUpdateBooks() {
    _formStateKey.currentState?.save();
    if (!isUpdate) {
      dbHelper.add(Menu(null, _menu));
    } else {
      dbHelper.update(Menu(pesananIdForUpdate, _menu));
    }
    _menuTitleController.text = '';
    refreshBookLists();
  }

  void editFormBook(BuildContext context, Menu book) {
    setState(() {
      isUpdate = true;
      pesananIdForUpdate = book.id!;
    });
    _menuTitleController.text = book.title;
  }

  void deleteBook(BuildContext context, int bookID) {
    setState(() {
      isUpdate = false;
    });
    _menuTitleController.text = '';
    dbHelper.delete(bookID);
    refreshBookLists();
  }

  @override
  Widget build(BuildContext context) {
    var textFormField = TextFormField(
      onSaved: (value) {
        _menu = value!;
      },
      autofocus: false,
      controller: _menuTitleController,
      decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: !isUpdate ? Colors.green : Colors.blue,
                  width: 2,
                  style: BorderStyle.solid)),
          labelText: !isUpdate ? 'Tambahkan Pesanan' : 'Edit Pesanan',
          icon:
              Icon(Icons.blinds_closed_sharp, color: !isUpdate ? Colors.green : Colors.blue),
          fillColor: Colors.white,
          labelStyle:
              TextStyle(color: !isUpdate ? Colors.green : Colors.blue)),
    );
    return Scaffold(
      appBar: AppBar (
        title: const Text('Catat Pesanan'),
      ),
        body: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Form(
            key: _formStateKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: textFormField,
                ),
              ],
            )),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
                onPressed: () {
                  createOrUpdateBooks();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: !isUpdate
                      ? Colors.green
                      : Colors.blue, // Set background color
                  foregroundColor: Colors.white,
                ),
                child: !isUpdate ? const Text('Save') : const Text('Update')),
            const SizedBox(
              width: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  cancelTextEditing();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, // Set background color
                  foregroundColor: Colors.white,
                ),
                child: const Text('Cancel')),
          ],
        ),
        const Divider(),
        Expanded(
            child: FutureBuilder(
          future: books,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Text('No Data');
            }
            if (snapshot.hasData) {
              return generateList(snapshot.data!);
            }
            return const CircularProgressIndicator();
          },
        ))
      ],
    ));
  }

  Widget generateList(List<Menu> books) {
    return ListView.builder(
      itemCount: books.length,
      itemBuilder: (context, index) => Slidable(
        // Customize appearance and behavior as needed
        key: ValueKey(index),
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              // An action can be bigger than the others.
              onPressed: (context) => editFormBook(context, books[index]),
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              icon: Icons.edit,
              label: 'Edit',
            ),
            SlidableAction(
              // An action can be bigger than the others.
              onPressed: (context) => deleteBook(context, books[index].id!),
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ), // Assuming each book has a unique id
        child: ListTile(title: Text(books[index].title)),
      ),
    );
  }
}
