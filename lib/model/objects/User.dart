class User{

  final int id;
  final String username;
  final String email;
  final String firstName;
  final String lastName;
  final String address;


  User({this.id, this.username, this.email, this.firstName,  this.lastName, this.address});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      address: json['address'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'username': username,
    'firstName': firstName,
    'lastName': lastName,
    'email': email,
    'address': address,
  };

  @override
  String toString() {
    return username;
  }
}
