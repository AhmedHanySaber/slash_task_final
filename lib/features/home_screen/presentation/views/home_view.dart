import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../data/data_sourse/proudct_local_data_source.dart';
import '../../data/models/proudct_model.dart';
import '../../data/repositories/proudct_repository_impl.dart';
import '../../domain/usecases/get_proudct.dart';
import '../blocs/proudct_bloc.dart';
import '../blocs/proudct_event.dart';
import '../blocs/proudct_state.dart';
import '../widgets/poroudct_card.dart';
import '../widgets/sale_section.dart';
import '../widgets/search_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc(
        GetProductList(ProductRepositoryImpl(ProductLocalDataSource())),
      )..add(LoadProductListEvent()),
      child: Scaffold(

        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
                  child: SearchFilterWidget(),
                ),
                SaleSection(),
                BlocBuilder<ProductBloc, ProductState>(
                  builder: (context, state) {
                    if (state is ProductLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is ProductLoaded) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          _buildCategoriesSection(context),
                          _buildProductSection(
                            context,
                            title: 'Best Selling',
                            products: state.productList.bestSelling,
                          ),
                          _buildProductSection(
                            context,
                            title: 'New Arrival',
                            products: state.productList.newArrival,
                          ),
                          _buildProductSection(
                            context,
                            title: 'Recommended for you',
                            products: state.productList.recommendedForYou,
                          ),
                        ],
                      );
                    } else if (state is ProductError) {
                      return Center(child: Text(state.message));
                    } else {
                      return Container();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProductSection(BuildContext context, {required String title, required List<Product> products}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                GestureDetector(
                  onTap: () {
                    // Handle "See all" tap
                  },
                  child:  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('See all'),
                      ),
                      SizedBox(width: 8),
                      CircleAvatar(
                        backgroundColor: Colors.grey[200],
                        radius: 15,
                        child: Icon(Icons.arrow_forward_ios, size: 15),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: products.map((product) {
                return SizedBox(
                  width: 210.0,
                  child: ProductCard(
                    imageUrl: product.image,
                    productName: product.name,
                    price: product.price.toString(),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoriesSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Categories',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                GestureDetector(
                  onTap: () {
                    // Handle "See all" tap
                  },
                  child:  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('See all'),
                      ),
                      SizedBox(width: 8),
                      CircleAvatar(
                        backgroundColor: Colors.grey[200],
                        radius: 15,
                        child: Icon(Icons.arrow_forward_ios, size: 15),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildCategoryItem('Fashion', 'assets/catagory/Fashion.svg'),
                _buildCategoryItem('Games', 'assets/catagory/Games.svg'),
                _buildCategoryItem('Accessories', 'assets/catagory/Accessories.svg'),
                _buildCategoryItem('Books', 'assets/catagory/Books.svg'),
                _buildCategoryItem('Artifacts', 'assets/catagory/Artifacts.svg'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(String name, String assetPath) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.black,
            child: SvgPicture.asset(
              assetPath,
              height: 40,
              width: 40,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              name,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
