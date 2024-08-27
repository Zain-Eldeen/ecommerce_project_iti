import 'package:e_commerce_app/Screens/NotificationsScreen.dart';
import 'package:e_commerce_app/Screens/bestSeller_Screen.dart';
import 'package:e_commerce_app/Screens/cart_screen.dart';
import 'package:e_commerce_app/Screens/favorites_screen.dart';
import 'package:e_commerce_app/Screens/product_detail_screen.dart';
import 'package:e_commerce_app/Screens/profile_screen.dart';
import 'package:e_commerce_app/Widgets/SearchScreenWidget.dart';
import 'package:e_commerce_app/Widgets/SideMenuWidget.dart';
import 'package:e_commerce_app/blocks/GetProductBlock/get_product_block.dart';
import 'package:e_commerce_app/blocks/GetProductBlock/get_product_state.dart';
import 'package:e_commerce_app/models/category_model.dart';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Trigger product fetching
    context.read<ProductBloc>().add(GetProductEvent());

    final List<CategoryModel> categories = [
      const CategoryModel(icon: Icons.checkroom, categoryName: "Nike"),
      const CategoryModel(icon: Icons.sports, categoryName: "Puma"),
      const CategoryModel(icon: Icons.kitchen, categoryName: "Under Armour"),
      const CategoryModel(icon: Icons.laptop, categoryName: "Adidas"),
      const CategoryModel(icon: Icons.more_horiz, categoryName: "Converse"),
    ];

    return Scaffold(
      drawer: SideMenu(),
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            pinned: true,
            elevation: 0,
            title: Padding(
              padding: const EdgeInsets.only(left: 16, top: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Store location',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  Row(
                    children: [
                      const Text(
                        'Mondolibug, Sylhet',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.arrow_drop_down,
                            color: Colors.black),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.search, color: Colors.black),
                onPressed: () {
                   Navigator.push(
              context, MaterialPageRoute(builder: (context) => SearchScreen()));
                },
              ),
              IconButton(
                icon: const Icon(Icons.notifications_none, color: Colors.black),
                onPressed: () {
                   Navigator.push(
              context, MaterialPageRoute(builder: (context) => NotificationsScreen()));
                },
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSearchBar(),
                  const SizedBox(height: 20),
                  _buildCategoryRow(categories),
                ],
              ),
            ),
          ),
          _buildProductList('Popular Shoes', context, isPopular: true),
          _buildProductList('New Arrivals', context),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        shape: const CircleBorder(),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CartScreen()));
        },
        child: const Icon(
          Icons.shopping_bag,
          
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintText: 'Looking for shoes',
          border: InputBorder.none,
          icon: Icon(Icons.search, color: Colors.grey),
        ),
      ),
    );
  }

  Widget _buildCategoryRow(List<CategoryModel> categories) {
    return SizedBox(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children:
            categories.map((category) => _buildCategoryItem(category)).toList(),
      ),
    );
  }

  Widget _buildCategoryItem(CategoryModel category) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.blue.shade100,
            child: Icon(category.icon, color: Colors.blue),
          ),
          const SizedBox(height: 8.0),
          Text(
            category.categoryName,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildProductList(String title, BuildContext context,
      {bool isPopular = false}) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader(title, context), // Use the new method here
          const SizedBox(height: 16),
          SizedBox(
            height: 270,
            child: BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state is ProductLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is ProductLoadedState) {
                  if (state.listProduct.isEmpty) {
                    return const Center(child: Text('No products available.'));
                  }
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.listProduct.length,
                    itemBuilder: (context, index) {
                      return _buildProductCard(
                          state.listProduct[index], context,
                          isPopular: isPopular);
                    },
                  );
                } else if (state is ProductErrorLoadingState) {
                  return Center(
                      child: Text(
                          'Failed to load products: ${state.errorMessage}'));
                } else {
                  return const Center(child: Text('Unknown state'));
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  // New method to build the section header with a "See All" button
  Widget _buildSectionHeader(String title, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
              context, MaterialPageRoute(builder: (context) => BestSellerScreen()));
            },
            child: const Text(
              'See All',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard(Product product, BuildContext context,
      {bool isPopular = false}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Container(
          width: 160,
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(16.0)),
                      child: Image.network(
                        product.thumbnail,
                        height: 150,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    if (isPopular)
                      Positioned(
                        top: 8,
                        left: 8,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          color: Colors.blue,
                          child: const Text(
                            'BEST SELLER',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '\$${product.price}',
                        style: const TextStyle(
                            color: Colors.red,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: Icon(
                              product.isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              context
                                  .read<ProductBloc>()
                                  .add(ToggleFavoriteEvent(product.id));
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.add_circle,
                                color: Colors.blue),
                            onPressed: () {
                              // context
                              //     .read<ProductBloc>()
                              //     .add(AddToCartEvent(product.id));
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FavoriteScreen()));
            },
          ),
          const SizedBox(
              width: 32.0), // The space for the floating action button
          IconButton(
            icon: const Icon(Icons.shopping_bag),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CartScreen()));
            },
          ),
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
               Navigator.push(
              context, MaterialPageRoute(builder: (context) => ProfileScreen()));
            },
          ),
        ],
      ),
    );
  }
}
