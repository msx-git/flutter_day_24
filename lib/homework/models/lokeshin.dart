class Lokeshin {
  final String city;
  final String country;

  Lokeshin({
    required this.city,
    required this.country,
  });

  Map<String, dynamic> toJson() {
    return {
      'city': city,
      'country': country,
    };
  }

  @override
  String toString() {
    return '$city, $country';
  }

  factory Lokeshin.fromJson(Map<String, dynamic> map) {
    return Lokeshin(
      city: map['city'] as String,
      country: map['country'] as String,
    );
  }
}
