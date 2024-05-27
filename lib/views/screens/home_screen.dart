import 'package:flutter/material.dart';
import 'package:flutter_day_24/controllers/products_controller.dart';
import 'package:flutter_day_24/models/product.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final productsController = ProductsController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    isLoading = true;
    productsController.getProducts().then((_) {
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
          : productsController.products.isEmpty
              ? const Center(child: Text('Mahsulotlar mavjud emas'))
              : GridView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: productsController.products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      childAspectRatio: 1 / 3),
                  itemBuilder: (context, index) {
                    Product product = productsController.products[index];
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
                            product.image,
                            height: 120,
                          ),
                          const SizedBox(height: 10),
                          Text(product.title,style: const TextStyle(fontWeight: FontWeight.w600),),
                          const SizedBox(height: 10),
                          Text(product.description.split('.')[0].split(',')[0]),
                          const SizedBox(height: 10),
                          Text("\$${product.price}",style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w600),)
                        ],
                      ),
                    );
                  },
                ),
    );
  }
}
