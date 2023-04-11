class User {
  int? id;
  String? name;
  String? username;
  String? email;
  Address? address;
  String? phone;
  String? website;
  Company? company;

  User.empty();

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });

  factory User.fromJson(Map<String, dynamic> data) {

    return User(
      id: data['id'],
      name: data['name'],
      username: data['username'],
      email: data['email'],
      address: Address.fromJson(data['address']),
      phone: data['phone'],
      website: data['website'],
      company: Company.fromJson(data['company']),
    );
  }
}

class Company {
  String? name;
  String? catchPhrase;
  String? bs;

  Company({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  factory Company.fromJson(Map<String, dynamic> data) {
    return Company(
      name: data['name'],
      catchPhrase: data['catchPhrase'],
      bs: data['bs'],
    );
  }
}

class Address {
  String? street;
  String? suite;
  String? city;
  String? zipcode;
  Geo? geo;

  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  Address.empty();

  factory Address.fromJson(Map<String, dynamic> data) {
    return Address(
      street: data['street'],
      suite: data['suite'],
      city: data['city'],
      zipcode: data['zipcode'],
      geo: Geo.fromJson(data['geo']),
    );
  }
}

class Geo {
  String? lat;
  String? lng;

  Geo({
    required this.lat,
    required this.lng,
  });

  Geo.empty();

  factory Geo.fromJson(Map<String, dynamic> data) {
    return Geo(
      lat: data['lat'],
      lng: data['lng'],
    );
  }
}
