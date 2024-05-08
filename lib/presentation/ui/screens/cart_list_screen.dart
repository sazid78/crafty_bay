import 'package:crafty_bay/presentation/state_holders/cart_list_controller.dart';
import 'package:crafty_bay/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/checkout_screen.dart';
import 'package:crafty_bay/presentation/ui/utility/app_color.dart';
import 'package:crafty_bay/presentation/ui/widgets/Carts/cart_prodcut_item.dart';
import 'package:crafty_bay/presentation/ui/widgets/center_circuler_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartListScreen extends StatefulWidget {
  const CartListScreen({super.key});

  @override
  State<CartListScreen> createState() => _CartListScreenState();
}

class _CartListScreenState extends State<CartListScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Get.find<CartListController>().getCartList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (_){
        Get.find<MainBottomNavController>().backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Carts"),
          leading: IconButton(
            onPressed: () {
              Get.find<MainBottomNavController>().backToHome();
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: GetBuilder<CartListController>(
          builder: (cartListController) {
            if(cartListController.inProgress == true){
              return const CenterCirculerProgressIndicator();
            }
            return Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    itemCount: cartListController.cartListModel.cartItemList?.length ?? 0,
                      itemBuilder: (context, index){
                        return  CartProductItem(
                          cartItem: cartListController.cartListModel.cartItemList![index],
                        );
                      },
                      separatorBuilder: (_,__) => const SizedBox(
                        height: 8,
                      ),
                  )
                ),
                totalPriceAndCheckoutSection(cartListController.totalPrice)
              ],
            );
          }
        ),
      ),
    );
  }

  Container  totalPriceAndCheckoutSection(RxDouble totalPrice) {
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
           Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Total Price",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black45),
              ),
              Obx(() => Text(
                "৳$totalPrice",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryColor),
              ),)
            ],
          ),
          SizedBox(
            width: 100,
            child: ElevatedButton(
              onPressed: () {
                Get.to(const CheckoutScreen());
              },
              child: const Text("Check Out"),
            ),
          )
        ],
      ),
    );
  }
}

