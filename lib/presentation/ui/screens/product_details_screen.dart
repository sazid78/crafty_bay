import 'package:crafty_bay/data/models/product_details_data.dart';
import 'package:crafty_bay/presentation/state_holders/add_to_cart_controller.dart';
import 'package:crafty_bay/presentation/state_holders/auth_controller.dart';
import 'package:crafty_bay/presentation/state_holders/product_details_controller.dart';
import 'package:crafty_bay/presentation/state_holders/verify_otp_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/auth/verify_email_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/product_reviews_screen.dart';
import 'package:crafty_bay/presentation/ui/utility/app_color.dart';
import 'package:crafty_bay/presentation/ui/widgets/Product_details/color_selector.dart';
import 'package:crafty_bay/presentation/ui/widgets/Product_details/product_image_carousel.dart';
import 'package:crafty_bay/presentation/ui/widgets/Product_details/size_selector.dart';
import 'package:crafty_bay/presentation/ui/widgets/center_circuler_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productId});

  final int productId;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  ValueNotifier<int> noOfItems = ValueNotifier(1);
  List<Color> colors = [
    Colors.pink,
    Colors.black,
    Colors.green,
    Colors.yellow,
    Colors.red
  ];

  List<String> sized = [
    "S",
    "M",
    "L",
    "XL",
    "XXL",
    "XXXL",
  ];

  Color? _selectedColor;
  String? _selectedSize;

  @override
  void initState() {
    super.initState();
    print(AuthController.token);
    Get.find<ProductDetailsController>().getProductDetails(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Details"),
      ),
      body: GetBuilder<ProductDetailsController>(
          builder: (productDetailsController) {
        if (productDetailsController.inProgress) {
          return const CenterCirculerProgressIndicator();
        }
        return Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ProductImageCarousel(
                      urls: [
                        productDetailsController.productDetails.img1 ?? '',
                        productDetailsController.productDetails.img2 ?? '',
                        productDetailsController.productDetails.img3 ?? '',
                        productDetailsController.productDetails.img4 ?? '',
                      ],
                    ),
                    productDetailsBody(productDetailsController.productDetails),
                  ],
                ),
              ),
            ),
            priceAndAddToCartSection
          ],
        );
      }),
    );
  }

  Padding productDetailsBody(ProductDetailsData productDetails) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                  child: Text(
                productDetails.product?.title ?? '',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              )),
              ValueListenableBuilder(
                  valueListenable: noOfItems,
                  builder: (context, value, _) {
                    return ItemCount(
                      initialValue: value,
                      minValue: 1,
                      maxValue: 20,
                      decimalPlaces: 0,
                      step: 1,
                      color: AppColors.primaryColor,
                      onChanged: (v) {
                        // Handle counter value changes
                        noOfItems.value = v.toInt();
                      },
                    );
                  }),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          ReviewAndRatingRow(productDetails.product?.star ?? 0),
          SizedBox(
            height: 8,
          ),
          Text(
            "Color",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
          ColorSelector(
            colors: productDetails.color
                    ?.split(",")
                    .map((e) => getColorFromString(e))
                    .toList() ??
                [],
            onChange: (selectedColor) {
              _selectedColor = selectedColor;
            },
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            "Size",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
          SizedBox(
            height: 8,
          ),
          SizeSelector(
              sizes: productDetails.size?.split(",") ?? [],
              onChange: (s) {
                _selectedSize = s;
              }),
          SizedBox(
            height: 16,
          ),
          Text(
            "Description",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            productDetails.des ?? "",
            style: TextStyle(
                color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Row ReviewAndRatingRow(int rating) {
    return Row(
      children: [
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Icon(
              Icons.star,
              size: 18,
              color: Colors.amber,
            ),
            SizedBox(
              width: 2,
            ),
            Text(
              rating.toStringAsPrecision(2),
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black45),
            )
          ],
        ),
        SizedBox(
          width: 8,
        ),
        TextButton(onPressed: (){
          Get.to(const ProductReviewScreen());
        }, child: Text("Reviews",style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.primaryColor),)),
        SizedBox(
          width: 8,
        ),
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          color: AppColors.primaryColor,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Icon(
              Icons.favorite_border_rounded,
              size: 18,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }

  Container get priceAndAddToCartSection {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(.15),
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(16),
          topLeft: Radius.circular(16),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Price",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black45),
              ),
              Text(
                "\$120",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryColor),
              ),
            ],
          ),
          SizedBox(
            width: 100,
            child:
                GetBuilder<AddToCartController>(builder: (addToCartController) {
              return Visibility(
                visible: addToCartController.inProgress == false,
                replacement: const CenterCirculerProgressIndicator(),
                child: ElevatedButton(
                  onPressed: () async {
                    if (_selectedColor != null && _selectedSize != null) {
                      if (Get.find<AuthController>().isTokenNotNull) {
                        final response = await addToCartController.addToCart(
                            widget.productId,
                            "color",
                            _selectedSize!,
                            noOfItems.value);
                        if (response) {
                          print(response);
                          Get.showSnackbar(const GetSnackBar(
                            title: "Success",
                            message: "This Product has been added to cart",
                            duration: Duration(seconds: 2),
                          ));
                        } else {
                          print(response);
                          Get.showSnackbar(GetSnackBar(
                            title: "Failed",
                            message: addToCartController.errorMessage,
                            duration: Duration(seconds: 2),
                          ));
                        }
                      }else{
                        Get.to(const VerifyEmailScreen());
                      }
                    }else{
                      Get.showSnackbar( GetSnackBar(
                        title: "Add to cart Failed",
                        message: addToCartController.errorMessage,
                        duration: const Duration(seconds: 2),
                      ));
                    }
                  },
                  child: const Text("Add To Cart"),
                ),
              );
            }),
          )
        ],
      ),
    );
  }

  Color getColorFromString(String color) {
    color = color.toLowerCase();
    if (color == "red") {
      return Colors.red;
    } else if (color == "white") {
      return Colors.white;
    } else if (color == "green") {
      return Colors.green;
    }
    return Colors.grey;
  }

  String colorToString(Color color) {
    if (color == Colors.red) {
      return "Red";
    } else if (color == Colors.white) {
      return "White";
    } else if (color == Colors.green) {
      return "Green";
    }
    return "Grey";
  }

  // Color getColorFromString(String colorCode){
  //   String code = colorCode.replaceAll("#", '');
  //   String hexCode = 'FF$code';
  //   return Color(int.parse('0x$hexCode'));
  // }
  //
  // String colorToHashColorCode(String colorCode){
  //   return colorCode.toString()
  //       .replaceAll("0xff", "#")
  //       .replaceAll("Color(", "")
  //       .replaceAll(")", "");
  // }
}
