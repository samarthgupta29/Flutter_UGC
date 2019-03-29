class LoginRequestObject {
  final String grant_type;
  final String client_id;
  final String client_secret;
  final String username;
  final String password;

  LoginRequestObject(this.grant_type, this.client_id, this.client_secret,
      this.username, this.password);

  LoginRequestObject.fromJson(Map<String, dynamic> json)
      : grant_type = json['grant_type'],
        client_id = json['client_id'],
        client_secret = json['client_secret'],
        username = json['username'],
        password = json['password'];

  Map<String, dynamic> toJson() => {
    'grant_type': grant_type,
    'client_id': client_id,
    'client_secret': client_secret,
    'username': username,
    'password': password,
  };
}
