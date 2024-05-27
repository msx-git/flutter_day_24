import 'employee.dart';
import 'location.dart';
import 'product.dart';

class Company {
  final String name;
  final DateTime foundedDate;
  final Lokeshin lokeshin;
  final List<Employee> employees;
  final List<Product> products;

  const Company({
    required this.name,
    required this.foundedDate,
    required this.lokeshin,
    required this.employees,
    required this.products,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'foundedDate': foundedDate,
      'lokeshin': lokeshin,
      'employees': employees,
      'products': products,
    };
  }

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      name: json['name'] as String,
      foundedDate: json['foundedDate'] as DateTime,
      lokeshin: json['lokeshin'] as Lokeshin,
      employees: json['employees'] as List<Employee>,
      products: json['products'] as List<Product>,
    );
  }
}
