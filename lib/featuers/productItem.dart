
import 'package:flutter/material.dart';
import 'package:selling_products_task/model/SourceRsesponceProduct.dart';
import 'package:selling_products_task/utilities/appAssets.dart';
import 'package:selling_products_task/utilities/appTheme.dart';

class ProuductItem extends StatelessWidget {
  static const String routeName = "prouductItem";
  final ProductsItem product;
  final int index;
  ProuductItem({super.key, required this.product, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*.30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppTheme.PrimaryColor,
            width: 3
        ),
      ),
      padding: const EdgeInsets.all(2),
      margin: const EdgeInsets.only(left: 10,right: 10),
      child:
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height*.15,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(child: Image.network(
                        product.images.isNotEmpty ? product.images[0] : "")

                    )
                ),
                Card(
                  elevation: 2,
                  shape: const CircleBorder(),
                    margin: const EdgeInsets.all(5),
                    child:Container(
                      padding: const EdgeInsets.all(3),
                      width: 25,
                        height: 25,
                        child: Image.asset(AppAssets.heart)) ,
                )

              ],
            ),
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  height: 100,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(18),
                      bottomLeft: Radius.circular(18),
                    ),
                    color: Colors.white
                  ),
                  margin: const EdgeInsets.all(4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(product.brand,style: AppTitle.titleStyleLarge,),
                      Text(product.category,style: AppTitle.titleStyleLarge),

                      const SizedBox(height: 7,),

                      Row(
                        children: [
                          Text("${product.sku}",style: AppTitle.titleStyleMedum),
                          const SizedBox(width: 10,),
                          Text("${product.rating}",style: AppTitle.titleStyleMedum),
                        ],
                      ),
                      const SizedBox(height: 7,),

                      Row(
                        children: [
                          const Text("Review",style: AppTitle.titleStyleSmall),
                          const SizedBox(width: 7,),
                          Text("(${product.rating})",style: AppTitle.titleStyleSmall),
                          Container(
                            margin: const EdgeInsets.all(2),
                            width: 18,
                              height: 18,
                              child: Image.asset(AppAssets.star))
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                    margin: const EdgeInsets.all(3),
                    child: const Icon(Icons.add_circle_outlined,color: AppTheme.blue,size: 32,))

              ],

            )

          ],

      ),
    );
  }
}
