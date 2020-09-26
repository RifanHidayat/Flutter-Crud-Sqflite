import 'package:flutter/material.dart';

class PageDetail extends StatelessWidget {
  String pertama, terakhir, email, phone, nim, jurusan;

  PageDetail(
      {this.pertama,
      this.terakhir,
      this.email,
      this.phone,
      this.nim,
      this.jurusan});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: Text('Detail Mahasiswa'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              _buildNIM(),
              _buildNama(),
              _buildJurusan(),
              _buildEmail(),
              _buildPhone()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNama() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Container(
        padding: new EdgeInsets.all(10.0),
        child: new Card(
          child: new Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: <Widget>[
                new Icon(
                  Icons.person,
                  color: Colors.black26,
                  size: 30,
                ),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        "$pertama $terakhir",
                        style:
                            new TextStyle(fontSize: 18.0, color: Colors.black),
                      ),
                      new Text(
                        "Nama Lengkap",
                        style: new TextStyle(
                            fontSize: 15.0, color: Colors.black54),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmail() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Container(
        padding: new EdgeInsets.all(10.0),
        child: new Card(
          child: new Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: <Widget>[
                new Icon(
                  Icons.email,
                  color: Colors.black26,
                  size: 30,
                ),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        "$email",
                        style:
                            new TextStyle(fontSize: 18.0, color: Colors.black),
                      ),
                      new Text(
                        "E-Mail",
                        style: new TextStyle(
                            fontSize: 15.0, color: Colors.black54),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNIM() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Container(
        padding: new EdgeInsets.all(10.0),
        child: new Card(
          child: new Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: <Widget>[
                new Icon(
                  Icons.minimize,
                  color: Colors.black26,
                  size: 30,
                ),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        "$nim",
                        style:
                            new TextStyle(fontSize: 18.0, color: Colors.black),
                      ),
                      new Text(
                        "NIM",
                        style: new TextStyle(
                            fontSize: 15.0, color: Colors.black54),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildJurusan() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Container(
        padding: new EdgeInsets.all(10.0),
        child: new Card(
          child: new Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: <Widget>[
                new Icon(
                  Icons.computer,
                  color: Colors.black26,
                  size: 30,
                ),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        "$jurusan",
                        style:
                            new TextStyle(fontSize: 18.0, color: Colors.black),
                      ),
                      new Text(
                        "Jurusan",
                        style: new TextStyle(
                            fontSize: 15.0, color: Colors.black54),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPhone() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Container(
        padding: new EdgeInsets.all(10.0),
        child: new Card(
          child: new Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: <Widget>[
                new Icon(
                  Icons.phone,
                  color: Colors.black26,
                  size: 30,
                ),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        "$phone",
                        style:
                            new TextStyle(fontSize: 18.0, color: Colors.black),
                      ),
                      new Text(
                        "Telp",
                        style: new TextStyle(
                            fontSize: 15.0, color: Colors.black54),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
