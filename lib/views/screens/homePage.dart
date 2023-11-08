import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/products_controller.dart';
import '../../modals/products.dart';
import '../utils/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.favorite),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.shopping_cart),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Consumer<ProductController>(
          builder: (context, pro, _) {
            return FutureBuilder(
              future: pro.getAllProducts(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 300,
                    ),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      ProductModal productModal = snapshot.data![index];

                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            MyRoutes.productDetailedPage,
                            arguments: pro.allProducts[index],
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Center(
                                      child: SizedBox(
                                        height: 150,
                                        width: 200,
                                        child: Image.network(
                                          productModal.thumbnail,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    productModal.title,
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontSize: productModal.title.length > 10
                                            ? 8
                                            : 12),
                                    overflow: TextOverflow.fade,
                                  ),
                                  const Spacer(),
                                  Text(
                                    "₹${productModal.price}",
                                    style: const TextStyle(fontSize: 15),
                                  ),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    productModal.category,
                                    style: const TextStyle(fontSize: 15),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  // Text(
                                  //   "${productModal.discountPercentage}%",
                                  //   style: const TextStyle(fontSize: 15),
                                  // ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text("ERROR: ${snapshot.error}"),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.indigo,
                    ),
                  );
                }
              },
            );
          },
        ),
      ),
    );
  }
}
