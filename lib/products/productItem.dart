
import 'package:flutter/material.dart';


import '../model/SourceRsesponceProduct.dart';
import '../utilities/appAssets.dart';
import '../utilities/appTheme.dart';

class ProductItem extends StatelessWidget {
  static const String routeName = "prouductItem";
  final ProductsItem product;
  final String image;
  ProductItem({super.key, required this.product, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*.34,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppTheme.PrimaryColor,
            width: 3
        ),
      ),
      padding: const EdgeInsets.all(2),
      margin: const EdgeInsets.only(left: 10,right: 10),
      child: Column(
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
                    child: Center(child: Image.network(image)

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
                  height: 140,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(18),
                      bottomLeft: Radius.circular(18),
                    ),
                  ),
                  margin: const EdgeInsets.all(7),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(product.title,style: AppTitle.titleStyleLarge,overflow: TextOverflow.visible,maxLines: 2),
                      SizedBox(height: 7,),
                      Text(product.description,style: AppTitle.titleStyleMedum,overflow: TextOverflow.ellipsis),

                      const SizedBox(height: 10,),

                      Row(
                        children: [
                          Text("EGP ${product.price}",style: AppTitle.titleStyleMedum,overflow: TextOverflow.ellipsis),
                          const SizedBox(width: 10,),
                          Text("${product.discountPercentage}",
                              style: AppTitle.titleStyleMedum.copyWith(
                                  fontSize: 13,color: Colors.blue,
                                  decoration: TextDecoration.lineThrough)),
                        ],
                      ),
                      Spacer(),

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
