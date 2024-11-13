import 'package:assesment/Screens/product_detailsscreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/products_providers.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Products'),
      ),
      body: Consumer<ProductProvider>(builder: (context, provider, child) {
        if (provider.products.isEmpty) {
          provider.getAll();
          return const Center(child: CircularProgressIndicator());
        }
        return GridView.builder(
          itemCount: 10,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 350,
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ProductDetails(model: provider.products[index]),
                  ));
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.blueAccent),
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.network(provider.products[index].image),
                  Text(provider.products[index].name,
                      maxLines: 2,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          overflow: TextOverflow.ellipsis)),
                  Text(provider.products[index].price.toString(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          overflow: TextOverflow.ellipsis))
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
