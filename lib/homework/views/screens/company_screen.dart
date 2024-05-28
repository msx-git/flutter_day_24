import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_day_24/homework/controllers/company_controller.dart';

class CompanyScreen extends StatefulWidget {
  const CompanyScreen({super.key, required this.companyIndex});

  final int companyIndex;

  @override
  State<CompanyScreen> createState() => _CompanyScreenState();
}

class _CompanyScreenState extends State<CompanyScreen> {
  final companyController = CompanyController();

  @override
  Widget build(BuildContext context) {
    final company = companyController.companies[widget.companyIndex];
    return Scaffold(
      appBar: AppBar(
        title: Text(company.name),
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Company Info'),
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Company name: ${company.name}"),
                          Text("City: ${company.lokeshin.city}"),
                          Text("Country: ${company.lokeshin.country}"),
                          Text(
                              "Founded on: ${company.foundedDate.day}/${company.foundedDate.month}/${company.foundedDate.year}"),
                        ],
                      ),
                    );
                  },
                );
              },
              icon: const Icon(CupertinoIcons.info)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Employees'),
                TextButton(onPressed: () {}, child: const Text('Add employee'))
              ],
            ),

            /// Employees
            Expanded(
              child: ListView.builder(
                itemCount: company.employees.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.black12),
                    ),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Text("${index + 1}-employee"),
                            RichText(
                                text: TextSpan(
                                    text: 'Name: ',
                                    style: const TextStyle(color: Colors.black),
                                    children: [
                                  TextSpan(text: company.employees[index].name)
                                ])),
                            RichText(
                                text: TextSpan(
                                    text: 'Age: ',
                                    style: const TextStyle(color: Colors.black),
                                    children: [
                                  TextSpan(
                                      text: '${company.employees[index].age}')
                                ])),
                            RichText(
                                text: TextSpan(
                                    text: 'Position: ',
                                    style: const TextStyle(color: Colors.black),
                                    children: [
                                  TextSpan(
                                      text: company.employees[index].position)
                                ])),
                            RichText(
                                text: TextSpan(
                                    text: 'Skills: ',
                                    style: const TextStyle(color: Colors.black),
                                    children: [
                                  TextSpan(
                                      text:
                                          '${company.employees[index].skills}')
                                ])),
                          ],
                        ),
                        const Spacer(),
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.edit)),
                        IconButton(
                            onPressed: () {
                              companyController.deleteEmployee(
                                companyIndex: widget.companyIndex,
                                employeeIndex: index,
                              );
                              setState(() {});
                            },
                            icon: const Icon(Icons.delete)),
                      ],
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Products'),
                TextButton(onPressed: () {}, child: const Text('Add product'))
              ],
            ),

            /// Products
            Expanded(
              child: ListView.builder(
                itemCount: company.products.length,
                itemBuilder: (context, index) {
                  return const Text('data');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
