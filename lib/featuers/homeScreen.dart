import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:selling_products_task/utilities/appAssets.dart';

import '../api/apiManager.dart';
import '../model/SourceRsesponceProduct.dart';
import '../products/productItem.dart';
import '../products/search.dart';
import '../utilities/appTheme.dart';
class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _FeaturesState();
}

class _FeaturesState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.only(top: 25,left: 20),
              child: const Text(
                "Start shopping...!",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.PrimaryColor),
              ),
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    showSearch(context: context, delegate: Search());
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 10, left: 20, bottom: 5),
                    width: MediaQuery.of(context).size.width * .75,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border:
                      Border.all(width: 3, color: const Color(0xB3004181)),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            width: 40,
                            height: 40,
                            margin: EdgeInsets.only(left: 30, top: 4, bottom: 4,right: 10),
                            child: Image.asset(AppAssets.search,
                                color: AppTheme.PrimaryColor)),
                        Container(
                            margin: EdgeInsets.only(top: 15),
                            child: const Text(
                              "What do you search for...?",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.PrimaryColorMain),
                            ))
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                Container(
                  margin: const EdgeInsets.only(
                      top: 10, right: 5, left: 10, bottom: 5),
                  width: 45,
                  height: 45,
                  child: Image.asset(
                    AppAssets.cart,
                    color: Color(0xB3004181),
                  ),
                )
              ],
            ),
            Expanded(
              child: FutureBuilder<SourceResponseProduct?>(
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
                              setState(() {});
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
                          var image = productList[index].images.first;
                          return ProductItem(product: productList[index], image: image);
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
