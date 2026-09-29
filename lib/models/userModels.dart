class User {
  String username;
  String password;

  User({required this.username, required this.password});
}

List<User> users = [
   User(username: "admin", password: "051"),
   User(username: "danu", password: "051"),
];