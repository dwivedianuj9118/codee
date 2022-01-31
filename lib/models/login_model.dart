class UserModel {
  String name;
  String email;
  String mobile;
  String gender;
  String address;
  String password;
  UserModel({
    required this.name,
    required this.email,
    required this.mobile,
    required this.gender,
    required this.address,
    required this.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      address: json['CustomerAddress'],
      email: json['CustomerEmail'],
      gender: json['CustomerGender'],
      mobile: json['CustomerPhone'],
      name: json['CustomerName'],
      password: json['CustomerPassword'],
    );
  }



  
}
