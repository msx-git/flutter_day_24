import 'package:flutter_day_24/homework/models/employee.dart';
import 'package:flutter_day_24/homework/models/lokeshin.dart';
import 'package:flutter_day_24/homework/models/product.dart';

import '../models/company.dart';

class CompanyController {
  CompanyController._();

  static final CompanyController _companyController = CompanyController._();

  factory CompanyController() {
    return _companyController;
  }

  final List<Company> _list = [
    Company(
      name: "Tech Solutions",
      foundedDate: DateTime(1998, 15, 05),
      lokeshin: Lokeshin(
        city: 'London',
        country: 'England',
      ),
      employees: [
        Employee(
            name: 'Alice',
            age: 30,
            position: 'Developer',
            skills: ['Dart', 'Flutter', 'Firebase'])
      ],
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

  void deleteEmployee({required int companyIndex, required int employeeIndex}) {
    _list[companyIndex].employees.removeAt(employeeIndex);
  }

  void addProduct({required int companyIndex, required Product product}) {
    _list[companyIndex].products.add(product);
  }
}
