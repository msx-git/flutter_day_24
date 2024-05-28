import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_day_24/homework/controllers/company_controller.dart';
import 'package:flutter_day_24/homework/views/screens/company_screen.dart';

import '../widgets/add_compay_bottom_sheet.dart';

class HomeScreen2 extends StatefulWidget {
  const HomeScreen2({super.key});

  @override
  State<HomeScreen2> createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {
  final companyController = CompanyController();

  @override
  Widget build(BuildContext context) {
    final companies = companyController.companies;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Companies'),
        actions: [
          IconButton(
            onPressed: () async {
              var newCompanyData = await showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return const AddCompanyBottomSheet();
                },
              );
              if (newCompanyData != null) {
                setState(() {
                  companyController.addCompany(
                    name: newCompanyData['name'],
                    foundedDate: newCompanyData['foundedDate'],
                    lokeshin: newCompanyData['lokeshin'],
                  );
                });
              }
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 50),
        itemCount: companies.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                  spreadRadius: 3,
                ),
              ],
            ),
            child: ListTile(
              onTap: () {
                Navigator.of(context).push(
                  CupertinoPageRoute(
                    builder: (context) => CompanyScreen(companyIndex: index),
                  ),
                );
              },
              leading: Text('${index + 1}'),
              title: Text(companies[index].name),
              trailing: const Icon(Icons.keyboard_arrow_right_rounded),
            ),
          );
        },
      ),
    );
  }
}
