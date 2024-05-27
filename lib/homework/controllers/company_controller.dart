import 'package:flutter_day_24/homework/models/location.dart';

import '../models/company.dart';

class CompanyController {
  final List<Company> _list = [
    Company(
      name: "Tech Solutions",
      foundedDate: DateTime(1998, 15, 05),
      lokeshin: Lokeshin(
        city: 'London',
        country: 'England',
      ),
      employees: [],
      products: [],
    ),
  ];

  List<Company> get companies => [..._list];

  void addCompany({
    required String name,
    required DateTime foundedDate,
    required Lokeshin lokeshin,
  }) {
    final newCompany = Company(
      name: name,
      foundedDate: foundedDate,
      lokeshin: lokeshin,
      employees: [],
      products: [],
    );
    _list.add(newCompany);
  }
}
