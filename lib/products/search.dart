import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:selling_products/products/productItem.dart';

import '../api/apiManager.dart';
import '../model/SourceRsesponceProduct.dart';
import '../utilities/appTheme.dart';

class Search extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
          showSuggestions(context);
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isNotEmpty) {
      return FutureBuilder<SourceResponseProduct?>(
        future: ApiManager.getSources(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                backgroundColor: AppTheme.green,
              ),
            );
          } else if (snapshot.hasError) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(child: Text("Something went wrong")),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      ApiManager.getSources();
                    },
                    child: const Text("Try Again"),
                  ),
                ),
              ],
            );
          } else if (snapshot.hasData) {
            var productList = snapshot.data?.products;
            if (productList != null && productList.isNotEmpty) {
              return MasonryGridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 2,
                itemCount: productList.length,
                itemBuilder: (context, index) {
                  if (index < productList.length) {
                    var image = productList[index].images.first;
                    return ProductItem(product: productList[index], image: image);
                  } else {
                    return Container();
                  }
                },
              );
            } else {
              return const Center(
                child: Text("No data found"),
              );
            }
          } else {
            return const Center(
              child: Text("No data found"),
            );
          }
        },
      );
    } else {
      return Container();
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isNotEmpty) {
      return FutureBuilder<SourceResponseProduct?>(
        future: ApiManager.getSources(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                backgroundColor: AppTheme.green,
              ),
            );
          } else if (snapshot.hasError) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(child: Text("Something went wrong")),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      ApiManager.getSources();
                    },
                    child: const Text("Try Again"),
                  ),
                ),
              ],
            );
          } else if (snapshot.hasData) {
            var productList = snapshot.data?.products;
            if (productList != null && productList.isNotEmpty) {
              return MasonryGridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 0,
                crossAxisSpacing: 0,
                itemCount: productList.length,
                itemBuilder: (context, index) {
                  if (index < productList.length) {
                    var image = productList[index].images.first;
                    return ProductItem(product: productList[index], image: image);
                  } else {
                    return Container();
                  }
                },
              );
            } else {
              return const Center(
                child: Text("No data found"),
              );
            }
          } else {
            return const Center(
              child: Text("No data found"),
            );
          }
        },
      );
    } else {
      return Container();
    }
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      primaryColor: Colors.white,
      primaryIconTheme: theme.primaryIconTheme.copyWith(color: Colors.black),
      textTheme: TextTheme(
        headline6: TextStyle(
          fontSize: 24, // تكبير حجم النص
          color: Colors.black,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16), // تعديل حجم الحواف
        hintStyle: TextStyle(
          fontSize: 18, // حجم النص في الحواف
        ),
      ),
    );
  }

  @override
  TextStyle get searchFieldStyle => TextStyle(fontSize: 24); // تكبير حجم النص في مربع البحث

  InputDecoration get searchFieldDecoration => InputDecoration(
    hintText: 'Search...',
    contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide.none,
    ),
  );
}
