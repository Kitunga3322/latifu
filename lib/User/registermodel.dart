class User {
  String username;
  String email;
  String password;

  User({required this.username, required this.email, required this.password});

  Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "password": password,
      };
}
