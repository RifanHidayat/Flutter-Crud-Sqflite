import 'dart:convert';
import 'package:crussqlite/database/services.dart';
import 'package:crussqlite/models/ModelAdmin.dart';
import 'package:crussqlite/models/ModelMahasiswa.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/cupertino.dart';
import 'package:toast/toast.dart';

class Validasi {
  DatabaseHelper db = new DatabaseHelper();

  Future<void> validasi_register(
    BuildContext context,
    String username,
    String firtsName,
    String lastname,
    String email,
    String telp,
    String password,
  ) {
    if (username.isEmpty) {
      Toast.show("Username belum diisi", context,
          duration: 5, gravity: Toast.BOTTOM);
    } else if (username.contains(" ")) {
      Toast.show("Username tidak boleh mengandung spasi", context,
          duration: 5, gravity: Toast.BOTTOM);
    } else if (firtsName.isEmpty) {
      Toast.show("field firts name tidak boleh kosong", context,
          duration: 5, gravity: Toast.BOTTOM);
    } else if (lastname.isEmpty) {
      Toast.show("field last name tidak boleh kosong", context,
          duration: 5, gravity: Toast.BOTTOM);
    } else if (!email.contains("@")) {
      Toast.show("Email tidak valid", context,
          duration: 5, gravity: Toast.BOTTOM);
    } else if (telp.isEmpty) {
      Toast.show("No telp harus diisi", context,
          duration: 5, gravity: Toast.BOTTOM);
    } else if (telp.length > 13) {
      Toast.show("No telp tidak boleh lebih dari 13 karakter", context,
          duration: 5, gravity: Toast.BOTTOM);
    } else if (password.length < 4 || password.length > 15) {
      Toast.show("Minimal password 4 karakter dan Maximal password 15 karakter",
          context,
          duration: 5, gravity: Toast.BOTTOM);
    } else {
      var encripPasswrod = md5.convert(utf8.encode(password)).toString();

      print(encripPasswrod);
      db
          .saveAdmin(ModelAdmin(
        username,
        firtsName,
        lastname,
        telp,
        email,
        encripPasswrod,
      ))
          .then((_) {
        Toast.show("Berhasil mekalkukan registrasi", context,
            duration: 5, gravity: Toast.BOTTOM);
        Navigator.pop(context);
      });
    }
  }

  void validasi_login(BuildContext context, String username, String password) {
    if (username.isEmpty) {
      Toast.show("Username anda kosong", context,
          duration: 5, gravity: Toast.BOTTOM);
    } else if (password.isEmpty) {
      Toast.show("Password anda kosong", context,
          duration: 5, gravity: Toast.BOTTOM);
    } else {
      var encripPassword = md5.convert(utf8.encode(password)).toString();
      db.doLogin(context, username, encripPassword);
    }
  }

  Future<void> validasi_form_mhs(
      BuildContext context,
      String nim,
      String firtsName,
      String lastname,
      String jurusan,
      String email,
      String telp,
      String action) {
    if (nim.isEmpty) {
      Toast.show("NIM belum diisi", context,
          duration: 5, gravity: Toast.BOTTOM);
    } else if (nim.contains(" ")) {
      Toast.show("NIM tidak boleh mengandung spasi", context,
          duration: 5, gravity: Toast.BOTTOM);
    } else if (firtsName.isEmpty) {
      Toast.show("field firts name tidak boleh kosong", context,
          duration: 5, gravity: Toast.BOTTOM);
    } else if (lastname.isEmpty) {
      Toast.show("field last name tidak boleh kosong", context,
          duration: 5, gravity: Toast.BOTTOM);
    } else if (jurusan.isEmpty) {
      Toast.show("Jurusan belum dipilih", context,
          duration: 5, gravity: Toast.BOTTOM);
    } else if (!email.contains("@")) {
      Toast.show("Email tidak valid", context,
          duration: 5, gravity: Toast.BOTTOM);
    } else if (telp.isEmpty) {
      Toast.show("No telp harus diisi", context,
          duration: 5, gravity: Toast.BOTTOM);
    } else if (telp.length > 13) {
      Toast.show("No telp tidak boleh lebih dari 13 karakter", context,
          duration: 5, gravity: Toast.BOTTOM);
    } else {
      if (action == "update") {
        db
            .updateMhs(ModelMahasiswa.fromMap({
          'NIM': nim,
          'firstname': firtsName,
          'lastname': lastname,
          'mobileno': telp,
          'emailid': email,
          'jurusan': jurusan,
        }))
            .then((_) {
          Toast.show("Data berhasil dirubah ", context,
              duration: 5, gravity: Toast.BOTTOM);
          Navigator.pop(context, "update");
        });
      } else {
        db
            .saveMhs(ModelMahasiswa(
          nim,
          firtsName,
          lastname,
          telp,
          email,
          jurusan,
        ))
            .then((_) {
          Toast.show("Berhasil menyimpan data mahasiswa ", context,
              duration: 5, gravity: Toast.BOTTOM);
          Navigator.pop(context, "save");
        });
      }
    }
  }
}
