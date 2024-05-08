import 'package:crafty_bay/presentation/state_holders/product_controller.dart';
import 'package:crafty_bay/presentation/ui/widgets/center_circuler_progress_indicator.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_card_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key, this.category, this.categoryId});

  final String? category;
  final int? categoryId;

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  void initState() {
    super.initState();
    if (widget.categoryId != null) {
      Get.find<ProductController>()
          .getProductList(categoryId: widget.categoryId!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category ?? "Products"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder<ProductController>(
          builder: (productController) {
            return Visibility(
              visible: productController.inProgess == false,
              replacement: const CenterCirculerProgressIndicator(),
              child: Visibility(
                visible: productController.productListModel.productList?.isNotEmpty ?? false,
                replacement: const Center(
                  child: Text("No Products"),
                ),
                child: GridView.builder(
                    itemCount: productController.productListModel.productList?.length ?? 0,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 0.90,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 8),
                    itemBuilder: (context, index) {
                      return FittedBox(
                          child: ProductCardItem(
                            product: productController.productListModel.productList![index],
                          ),
                          );
                    }),
              ),
            );
          }
        ),
      ),
    );
  }
}
