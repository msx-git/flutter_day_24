import 'package:flutter/material.dart';

import '../../controllers/produkts_controller.dart';
import '../../models/produkt.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final produktsController = ProduktsController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    isLoading = true;
    produktsController.getProdukts().then((_) {
      isLoading = false;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFAFAFA),
      appBar: AppBar(
        title: const Text('Mahsulotlar'),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : produktsController.produkts.isEmpty
              ? const Center(child: Text('Mahsulotlar mavjud emas'))
              : GridView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: produktsController.produkts.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      childAspectRatio: 1 / 3),
                  itemBuilder: (context, index) {
                    Produkt produkt = produktsController.produkts[index];
                    return Container(
                      padding: const EdgeInsets.all(20),
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 10,
                          )
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.network(
                            produkt.image,
                            height: 120,
                          ),
                          const SizedBox(height: 10),
                          Text(produkt.title,style: const TextStyle(fontWeight: FontWeight.w600),),
                          const SizedBox(height: 10),
                          Text(produkt.description.split('.')[0].split(',')[0]),
                          const SizedBox(height: 10),
                          Text("\$${produkt.price}",style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w600),)
                        ],
                      ),
                    );
                  },
                ),
    );
  }
}
