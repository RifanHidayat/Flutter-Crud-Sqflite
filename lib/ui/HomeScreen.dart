import 'package:crussqlite/database/services.dart';
import 'package:crussqlite/models/ModelMahasiswa.dart';
import 'package:crussqlite/ui/DetailMahasiswaScreen.dart';
import 'package:crussqlite/ui/FormMahasiswaScreen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScereenState createState() => _HomeScereenState();
}

class _HomeScereenState extends State<HomeScreen> {
  List<ModelMahasiswa> items = new List();
  DatabaseHelper db = new DatabaseHelper();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    db.getAllMhs().then((m) {
      setState(() {
        m.forEach((mahasiswa) {
          items.add(ModelMahasiswa.fromMap(mahasiswa));
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Colors.greenAccent,
      ),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                contentPadding: EdgeInsets.only(left: 16),
                title: Text(
                  '${items[index].firstname} ${items[index].lastname}',
                  style: TextStyle(
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      color: Colors.deepOrangeAccent),
                ),
                subtitle: Text(
                  '${items[index].jurusan}',
                ),
                onTap: () {
                  _navigateToMahasiswa(context, items[index]);
                },
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    AlertDialog hapus = AlertDialog(
                      title: Text('Information'),
                      content: Container(
                        height: 100.0,
                        child: Column(
                          children: <Widget>[
                            Text(
                                'Apakah anda yakin ingin hapus data ${items[index].firstname}')
                          ],
                        ),
                      ),
                      actions: <Widget>[
                        FlatButton(
                          child: Text('yes'),
                          onPressed: () {
                            _deletePegawai(context, items[index], index);
                            Navigator.pop(context);
                          },
                        ),
                        FlatButton(
                          child: Text('no'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    );
                    showDialog(context: context, child: hapus);
                  },
                ),
                leading: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PageDetail(
                                  pertama: items[index].firstname,
                                  terakhir: items[index].lastname,
                                  phone: items[index].mobileno,
                                  email: items[index].emailid,
                                  nim: items[index].NIM,
                                  jurusan: items[index].jurusan,
                                )));
                  },
                  icon: Icon(Icons.visibility),
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.green,
          onPressed: () {
            _createNewPegawai(context);
          }),
    );
  }

  _deletePegawai(BuildContext context, ModelMahasiswa mhs, int position) {
    db.deleteMhs(mhs.NIM).then((m) {
      setState(() {
        items.removeAt(position);
      });
    });
  }

  void _navigateToMahasiswa(BuildContext context, ModelMahasiswa mhs) async {
    String result = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => FormMahasiswaScreen(mhs)));
    if (result == 'update') {
      db.getAllMhs().then((m) {
        setState(() {
          items.clear();
          m.forEach((mahasiswa) {
            items.add(ModelMahasiswa.fromMap(mahasiswa));
          });
        });
      });
    }
  }

  void _createNewPegawai(BuildContext context) async {
    String result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                FormMahasiswaScreen(ModelMahasiswa('', '', '', '', '', ''))));
    if (result == 'save') {
      db.getAllMhs().then((m) {
        setState(() {
          items.clear();
          m.forEach((mahasiswa) {
            items.add(ModelMahasiswa.fromMap(mahasiswa));
          });
        });
      });
    }
  }
}
