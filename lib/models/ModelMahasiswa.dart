class ModelMahasiswa {
  String _NIM;
  String _firstName;
  String _lastName;
  String _mobileNo;
  String _emailId;
  String _jurusan;

  ModelMahasiswa(this._NIM, this._firstName, this._lastName, this._mobileNo,
      this._emailId, this._jurusan);

  ModelMahasiswa.map(dynamic obj) {
    this._NIM = obj['NIM'];
    this._jurusan = obj['jurusan'];
    this._firstName = obj['firstname'];
    this._lastName = obj['lastname'];
    this._mobileNo = obj['mobileno'];
    this._emailId = obj['emailid'];
  }

  String get NIM => _NIM;

  String get jurusan => _jurusan;

  String get firstname => _firstName;

  String get lastname => _lastName;

  String get mobileno => _mobileNo;

  String get emailid => _emailId;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['NIM'] = NIM;
    map['firstname'] = _firstName;
    map['lastname'] = _lastName;
    map['mobileno'] = _mobileNo;
    map['emailid'] = _emailId;
    map['jurusan'] = _jurusan;

    return map;
  }

  ModelMahasiswa.fromMap(Map<String, dynamic> map) {
    this._NIM = map['NIM'];
    this._firstName = map['firstname'];
    this._lastName = map['lastname'];
    this._jurusan = map['jurusan'];
    this._mobileNo = map['mobileno'];
    this._emailId = map['emailid'];
  }
}
