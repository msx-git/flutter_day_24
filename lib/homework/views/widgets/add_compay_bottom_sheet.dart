import 'package:flutter/material.dart';

import '../../models/lokeshin.dart';
import 'my_text_from_field.dart';

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
