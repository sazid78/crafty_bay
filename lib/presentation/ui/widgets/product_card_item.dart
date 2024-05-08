import 'package:crafty_bay/data/models/product_model.dart';
import 'package:crafty_bay/presentation/ui/screens/product_details_screen.dart';
import 'package:crafty_bay/presentation/ui/utility/app_color.dart';
import 'package:crafty_bay/presentation/ui/utility/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCardItem extends StatelessWidget {
  const ProductCardItem({
    super.key, required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.to(ProductDetailsScreen(
          productId: product.id!,
        ));
      },
      borderRadius: BorderRadius.circular(16),
      child: SizedBox(
        height: 190,
        width: 160,
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16)),
                  child: Image.network(
                    product.image ?? "",
                    width: 160,
                    height: 110,
                    fit: BoxFit.cover,
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.title ?? "",style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey
                    ),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("৳${product.price ?? 0}",style:const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primaryColor
                        ),),
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                           const Icon(Icons.star,size: 14,color: Colors.amber,),
                            Text("${product.star ?? 0}",style:const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.black45
                            ),)
                          ],
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)
                          ),
                          color: AppColors.primaryColor,
                          child:const Padding(
                            padding:  EdgeInsets.all(2.0),
                            child: Icon(Icons.favorite_border_rounded,size: 10,color: Colors.white,),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
