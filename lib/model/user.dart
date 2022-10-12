class User {
  final String name;
  final String email;
  final String imageUrl;

  const User({
    required this.name,
    required this.email,
    required this.imageUrl,
  });

  User copy({
  String? name,
    String? email,
    String? imageUrl,
}) =>
  User(
    name: name ?? this.name,
    email: email ?? this.email,
    imageUrl: imageUrl ?? this.imageUrl,
  );

  static User fromJson(Map<String, dynamic> json) => User(
    name: json ['name'],
    email: json ['email'],
    imageUrl: json['imageUrl']
  );


  Map<String, dynamic> toJson() => {
    'name' : name,
    'email' : email,
    'imageUrl' : imageUrl,
  };
}