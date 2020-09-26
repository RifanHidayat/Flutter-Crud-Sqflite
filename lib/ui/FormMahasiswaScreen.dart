import 'package:crussqlite/Validasi/Validator.dart';
import 'package:crussqlite/models/ModelMahasiswa.dart';
import 'package:crussqlite/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormMahasiswaScreen extends StatefulWidget {
  final ModelMahasiswa modelMahasiswa;

  FormMahasiswaScreen(this.modelMahasiswa);

  @override
  _FormMahasiswaScreenState createState() => _FormMahasiswaScreenState();
}

class _FormMahasiswaScreenState extends State<FormMahasiswaScreen> {
  TextEditingController _cnim;
  TextEditingController _cfirst_name;
  TextEditingController _clast_name;
  TextEditingController _cemail;
  TextEditingController _ctelp;

  @override
  void initState() {
    super.initState();
    _cnim = new TextEditingController(text: widget.modelMahasiswa.NIM);
    _cfirst_name =
        new TextEditingController(text: widget.modelMahasiswa.firstname);
    _clast_name =
        new TextEditingController(text: widget.modelMahasiswa.lastname);
    _cemail = new TextEditingController(text: widget.modelMahasiswa.emailid);
    _ctelp = new TextEditingController(text: widget.modelMahasiswa.mobileno);
    // TODO: implement initState
    if (widget.modelMahasiswa.NIM != "") {
      if (widget.modelMahasiswa.jurusan == "Teknik Informatika") {
        _value = 1;
      } else if (widget.modelMahasiswa.jurusan == "Teknik Komputer") {
        _value = 2;
      } else if (widget.modelMahasiswa.jurusan == "Sistem Komputer") {
        _value = 3;
      } else if (widget.modelMahasiswa.jurusan == "Sistem Informasi") {
        _value = 4;
      }
    } else {
      _value = 0;
    }
  }

  var jurusan = '';
  int _value;
  Validasi validasi = new Validasi();

  Widget _buildNIMTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          height: 60.0,
          child: TextFormField(
            controller: _cnim,
            keyboardType: TextInputType.number,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
            decoration: new InputDecoration(
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.black26,
                ),
                hintText: "Masukan NIM anda",
                hintStyle: kHintTextStyleLabel,
                labelText: "NIM",
                labelStyle: kHintTextStyleLabel,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                    borderRadius: new BorderRadius.circular(20.0)),
                focusedBorder: new OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green[200]),
                    borderRadius: new BorderRadius.circular(20.0))),
          ),
        ),
      ],
    );
  }

  Widget _buildFirtsNameTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          height: 60.0,
          child: TextFormField(
            controller: _cfirst_name,
            keyboardType: TextInputType.name,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
            decoration: new InputDecoration(
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.black26,
                ),
                hintText: "Masukan first name anda",
                hintStyle: kHintTextStyleLabel,
                labelText: "Firts Name",
                labelStyle: kHintTextStyleLabel,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                    borderRadius: new BorderRadius.circular(20.0)),
                focusedBorder: new OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green[200]),
                    borderRadius: new BorderRadius.circular(20.0))),
          ),
        ),
      ],
    );
  }

  Widget _buildLastNameTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          height: 60.0,
          child: TextFormField(
            controller: _clast_name,
            keyboardType: TextInputType.name,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
            decoration: new InputDecoration(
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.black26,
                ),
                hintText: "Masukan last name anda",
                hintStyle: kHintTextStyleLabel,
                labelText: "Last Name",
                labelStyle: kHintTextStyleLabel,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                    borderRadius: new BorderRadius.circular(20.0)),
                focusedBorder: new OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green[200]),
                    borderRadius: new BorderRadius.circular(20.0))),
          ),
        ),
      ],
    );
  }

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          height: 60.0,
          child: TextFormField(
            controller: _cemail,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
            decoration: new InputDecoration(
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.black26,
                ),
                hintText: "Masukan alamat E-mail anda ",
                hintStyle: kHintTextStyleLabel,
                labelText: "Email",
                labelStyle: kHintTextStyleLabel,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                    borderRadius: new BorderRadius.circular(20.0)),
                focusedBorder: new OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green[200]),
                    borderRadius: new BorderRadius.circular(20.0))),
          ),
        ),
      ],
    );
  }

  Widget _buildTelpTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          height: 60.0,
          child: TextFormField(
            controller: _ctelp,
            keyboardType: TextInputType.number,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
            decoration: new InputDecoration(
                prefixIcon: Icon(
                  Icons.phone,
                  color: Colors.black26,
                ),
                hintText: "Masukan No telp anda",
                hintStyle: kHintTextStyleLabel,
                labelText: "No Telp",
                labelStyle: kHintTextStyleLabel,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                    borderRadius: new BorderRadius.circular(20.0)),
                focusedBorder: new OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green[200]),
                    borderRadius: new BorderRadius.circular(20.0))),
          ),
        ),
      ],
    );
  }

  Widget _buildSimpanBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30.0),
      width: double.infinity,
      child: RaisedButton(
        child: (widget.modelMahasiswa.NIM != "")
            ? Text(
                'Update',
                style: TextStyle(
                  color: Color(0xFF527DAA),
                  letterSpacing: 1.5,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                ),
              )
            : Text(
                'Add',
                style: TextStyle(
                  color: Color(0xFF527DAA),
                  letterSpacing: 1.5,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                ),
              ),
        elevation: 5.0,
        onPressed: () {
          if (_value == 0) {
            jurusan = "";
          }
          if (_value == 1) {
            jurusan = "Teknik Informatika";
          }
          if (_value == 2) {
            jurusan = "Teknik Komputer";
          }
          if (_value == 3) {
            jurusan = "Sistem Komputer";
          }
          if (_value == 4) {
            jurusan = "Sistem Informasi";
          }

          if (widget.modelMahasiswa.NIM != "") {
            setState(() {
              validasi.validasi_form_mhs(
                  context,
                  _cnim.text,
                  _cfirst_name.text,
                  _clast_name.text,
                  jurusan,
                  _cemail.text,
                  _ctelp.text,
                  "update");
            });
          } else {
            setState(() {
              validasi.validasi_form_mhs(context, _cnim.text, _cfirst_name.text,
                  _clast_name.text, jurusan, _cemail.text, _ctelp.text, "add");
            });
          }
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.white,
      ),
    );
  }

  Widget _buildJurusan() {
    return Container(
      margin: EdgeInsets.only(right: 10, left: 10),
      width: double.infinity,
      height: 60,
      child: DropdownButton(
          value: _value,
          items: [
            DropdownMenuItem(
              child: Text(
                  "--pilih Jurusan--                                     "),
              value: 0,
            ),
            DropdownMenuItem(
              child: Text("Teknik Informatika"),
              value: 1,
            ),
            DropdownMenuItem(
              child: Text("Teknik Komputer"),
              value: 2,
            ),
            DropdownMenuItem(child: Text("Sistem Komputer"), value: 3),
            DropdownMenuItem(child: Text("Sistem Informasi"), value: 4)
          ],
          onChanged: (value) {
            setState(() {
              _value = value;
            });
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form Mahasiswa"),
        backgroundColor: Colors.greenAccent,
      ),
      backgroundColor: Colors.white,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 20.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 10.0),
                      _buildNIMTF(),
                      SizedBox(
                        height: 15.0,
                      ),
                      _buildFirtsNameTF(),
                      SizedBox(
                        height: 15.0,
                      ),
                      _buildLastNameTF(),
                      SizedBox(
                        height: 15.0,
                      ),
                      _buildJurusan(),
                      SizedBox(
                        height: 15.0,
                      ),
                      _buildEmailTF(),
                      SizedBox(
                        height: 15.0,
                      ),
                      _buildTelpTF(),
                      SizedBox(
                        height: 15.0,
                      ),
                      _buildSimpanBtn(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
