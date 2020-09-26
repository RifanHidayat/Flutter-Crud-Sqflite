class ModelAdmin {
  String _username;
  String _firstName;
  String _lastName;
  String _mobileno;
  String _emailid;
  String _password;

  ModelAdmin(this._username, this._firstName, this._lastName, this._mobileno,
      this._emailid, this._password);

  ModelAdmin.map(dynamic obj) {
    this._username = obj['username'];
    this._firstName = obj['firstname'];
    this._lastName = obj['lastname'];
    this._mobileno = obj['mobileno'];
    this._emailid = obj['emailid'];
    this._password = obj['password'];
  }

  String get username => _username;

  String get firstname => _firstName;

  String get lastname => _lastName;

  String get mobileno => _mobileno;

  String get emailid => _emailid;

  String get password => _password;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['username'] = _username;
    map['firstname'] = _firstName;
    map['lastname'] = _lastName;
    map['mobileno'] = _mobileno;
    map['emailid'] = _emailid;
    map['password'] = _password;
    return map;
  }

  ModelAdmin.fromMap(Map<String, dynamic> map) {
    this._username = map['username'];
    this._firstName = map['firstname'];
    this._lastName = map['lastname'];
    this._mobileno = map['mobileno'];
    this._emailid = map['emailid'];
    this._password = map['password'];
  }
}
