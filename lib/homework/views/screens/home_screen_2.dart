import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_day_24/homework/controllers/company_controller.dart';
import 'package:flutter_day_24/homework/models/location.dart';

import '../widgets/my_text_from_field.dart';

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
                    builder: (context) => const Text('data'),
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

class AddCompanyBottomSheet extends StatefulWidget {
  const AddCompanyBottomSheet({super.key});

  @override
  State<AddCompanyBottomSheet> createState() => _AddCompanyBottomSheetState();
}

class _AddCompanyBottomSheetState extends State<AddCompanyBottomSheet> {
  var foundedDate = DateTime.now();

  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final cityController = TextEditingController();
  final countryController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    cityController.dispose();
    countryController.dispose();
    super.dispose();
  }

  void addCompany() {
    if (formKey.currentState!.validate()) {
      Navigator.pop(context, {
        'name': nameController.text.trim(),
        'foundedDate': foundedDate,
        'lokeshin': Lokeshin(
          city: cityController.text.trim(),
          country: countryController.text.trim(),
        ),
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 685,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MyTextFormField(
                controller: nameController,
                labelText: "Company name",
                errorText: "Please, company enter name!",
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      'Founded date: ${foundedDate.day}/${foundedDate.month}/${foundedDate.year}'),
                  TextButton(
                    onPressed: () {
                      showDatePicker(
                        context: context,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                        currentDate: DateTime.now(),
                        initialDate: foundedDate,
                      ).then((value) => setState(() => foundedDate = value!));
                    },
                    child: const Text('Set date'),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text('Enter location details'),
              const SizedBox(height: 10),
              MyTextFormField(
                controller: cityController,
                labelText: 'City name',
                errorText: "Please enter city name",
              ),
              const SizedBox(height: 10),
              MyTextFormField(
                controller: countryController,
                labelText: 'Country name',
                errorText: "Please enter country name",
              ),
              const SizedBox(height: 10),
              FilledButton(
                onPressed: addCompany,
                child: const Text('Add Company'),
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
