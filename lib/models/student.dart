class Student {
  String id;
  String name;
  String email;
  String dateOfBirth;
  String contact;
  String department;
  String year;
  String address;

  Student({
    required this.id,
    required this.name,
    required this.email,
    required this.dateOfBirth,
    required this.contact,
    required this.department,
    required this.year,
    required this.address,
  });

  factory Student.fromJson(Map<String, dynamic> json) => Student(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        dateOfBirth: json['date_of_birth'],
        contact: json['contact'],
        department: json['department'],
        year: json['year'],
        address: json['address'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'date_of_birth': dateOfBirth,
        'contact': contact,
        'department': department,
        'year': year,
        'address': address,
      };
}
